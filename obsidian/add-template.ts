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
import { ensureDir } from "https://deno.land/std@0.224.0/fs/mod.ts";
import select from "npm:@inquirer/select";

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
      templates.push(dirEntry.name);
    }

    // 選択プロンプトを使用してテンプレートを選択
    const choices = templates.map((name) => ({ name, value: name }));
    const templateName = await select<string>({
      message: "コピーしたいテンプレートを選択してください:",
      choices,
    });

    const currentDir = Deno.cwd();

    // テンプレートをコピー
    console.log(`テンプレート '${templateName}' をコピーしています...`);

    // .obsidianディレクトリを作成
    const obsidianDir = join(currentDir, ".obsidian");
    await ensureDir(obsidianDir);

    // workspace.jsonを空ファイルとして作成
    const workspacePath = join(obsidianDir, "workspace.json");
    await Deno.writeTextFile(workspacePath, "");

    console.log("コピー完了しました。");
    Deno.exit(0);
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
