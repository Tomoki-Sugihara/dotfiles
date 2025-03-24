#!/usr/bin/env -S deno run --allow-read --allow-write --allow-run --allow-env
// Obsidian CLI - 引数に応じて実行ファイルを出し分け

import { main as addTemplate } from "./add-template.ts";

/**
 * ヘルプオプションかどうかをチェック
 */
function isHelpOption(option: string): boolean {
  return option === "help" || option === "--help" || option === "-h";
}

/**
 * ヘルプメッセージを表示
 */
function showHelp(command?: string) {
  switch (command) {
    case "template":
      console.log("Obsidian テンプレートコマンド");
      console.log("使用方法: obs template <サブコマンド>");
      console.log("\nサブコマンド:");
      console.log("  add                - 現在のディレクトリにテンプレートをコピー");
      console.log("  help, -h, --help   - このヘルプを表示");
      break;
    default:
      console.log("Obsidian CLI ツール");
      console.log("使用方法: obs <コマンド> [オプション]");
      console.log("\nコマンド:");
      console.log("  template           - テンプレート操作");
      console.log("  help, -h, --help   - このヘルプを表示");
      break;
  }
}

/**
 * メイン関数
 */
async function main() {
  const args = Deno.args;
  
  // 引数がない場合、またはヘルプオプションが指定された場合
  if (args.length === 0 || isHelpOption(args[0])) {
    showHelp();
    return;
  }

  const command = args[0];
  const subCommand = args.length > 1 ? args[1] : null;

  switch (command) {
    case "template": {
      if (!subCommand) {
        showHelp("template");
        break;
      }

      switch (subCommand) {
        case "add": {
          // add-template.ts をインポートして実行
          await addTemplate();
          break;
        }
        case "help":
        case "-h":
        case "--help":
          showHelp("template");
          break;
        default:
          console.error(`エラー: 不明なテンプレートサブコマンド '${subCommand}'`);
          showHelp("template");
          Deno.exit(1);
          break;
      }
      break;
    }
    default:
      console.error(`エラー: 不明なコマンド '${command}'`);
      showHelp();
      Deno.exit(1);
      break;
  }
}

// CLI実行
main();

