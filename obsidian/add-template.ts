#!/usr/bin/env -S deno run --allow-read --allow-write --allow-run

/**
 * Obsidianのテンプレートをコピーするスクリプト (Deno版)
 * 
 * 1. templatesファオルダ内のフォルダを取得
 * 2. 対話的にフォルダを選択
 * 3. 呼び出し元のフォルダにコピー
 * 4. .obsidian/workspace.jsonはファイルだけ作成して中身は空
 */

import { basename, dirname, join } from "https://deno.land/std/path/mod.ts";
import { ensureDir, copy } from "https://deno.land/std/fs/mod.ts";

// 現在のスクリプトの場所を取得
const scriptDir = dirname(new URL(import.meta.url).pathname);
// テンプレートの格納場所
const TEMPLATES_DIR = join(scriptDir, "templates");

// メイン関数
export async function main() {
  try {
    // テンプレートフォルダ一覧を取得
    const templates: string[] = [];
    for await (const dirEntry of Deno.readDir(TEMPLATES_DIR)) {
      if (dirEntry.isDirectory && dirEntry.name !== ".obsidian") {
        templates.push(dirEntry.name);
      }
    }

    if (templates.length === 0) {
      console.log("テンプレートが見つかりません。");
      Deno.exit(1);
    }

    // テンプレート一覧を表示
    console.log("利用可能なテンプレート:");
    templates.forEach((template, index) => {
      console.log(`${index + 1}) ${template}`);
    });

    // 対話的にテンプレートを選択
    const buf = new Uint8Array(1024);
    console.log("コピーしたいテンプレート番号を入力してください:");
    const n = await Deno.stdin.read(buf);
    const input = new TextDecoder().decode(buf.subarray(0, n!)).trim();
    const choice = parseInt(input, 10);

    if (isNaN(choice) || choice < 1 || choice > templates.length) {
      console.log("無効な選択です。終了します。");
      Deno.exit(1);
    }

    const templateName = templates[choice - 1];
    const templatePath = join(TEMPLATES_DIR, templateName);
    const currentDir = Deno.cwd();

    // テンプレートをコピー
    console.log(`テンプレート '${templateName}' をコピーしています...`);
    
    // テンプレートディレクトリの中身を現在のディレクトリにコピー
    for await (const entry of Deno.readDir(templatePath)) {
      const src = join(templatePath, entry.name);
      const dest = join(currentDir, entry.name);
      
      await copy(src, dest, { overwrite: true });
    }

    // .obsidianディレクトリを作成
    const obsidianDir = join(currentDir, ".obsidian");
    await ensureDir(obsidianDir);

    // workspace.jsonを空ファイルとして作成
    const workspacePath = join(obsidianDir, "workspace.json");
    await Deno.writeTextFile(workspacePath, "");

    console.log("コピー完了しました。");
  } catch (error) {
    console.error("エラーが発生しました:", error instanceof Error ? error.message : String(error));
    Deno.exit(1);
  }
}

// スクリプトが直接実行された場合のみmain関数を実行
if (import.meta.main) {
  main();
}
