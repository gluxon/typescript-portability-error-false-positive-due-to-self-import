// 🚨 This self-reference causes the non-portable type false positive. 🚨
// Importing from "./C" instead of "c" fixes the issue.
import { C } from "c";

export type C2 = C;
