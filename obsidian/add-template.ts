#!/usr/bin/env -S deno run --allow-read --allow-write --allow-run

/**
 * Obsidianのテンプレートをコピーするスクリプト (Deno版)
 *
 * 1. templatesファオルダ内のフォルダを取得
 * 2. 対話的にフォルダを選択
 * 3. 呼び出し元のフォルダにコピー
 * 4. .obsidian/workspace.jsonはファイルだけ作成して中身は空
 */

import { dirname, join } from "https://deno.land/std@0.224.0/path/mod.ts";
import { copy, ensureDir } from "https://deno.land/std@0.224.0/fs/mod.ts";
import select from "npm:@inquirer/select";

// 型定義
interface Choice {
  name: string;
  value: string;
}

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

    // 選択プロンプトを使用してテンプレートを選択
    const choices: Choice[] = templates.map((name) => ({ name, value: name }));
    const templateName = await select<string>({
      message: "コピーしたいテンプレートを選択してください:",
      choices,
    });

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
    console.error(
      "エラーが発生しました:",
      error instanceof Error ? error.message : String(error),
    );
    Deno.exit(1);
  }
}

// スクリプトが直接実行された場合のみmain関数を実行
if (import.meta.main) {
  main();
}
