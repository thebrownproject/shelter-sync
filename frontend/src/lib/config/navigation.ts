import HouseIcon from "@lucide/svelte/icons/house";
import Dog from "@lucide/svelte/icons/dog";
import scanText from "@lucide/svelte/icons/scan-text";

export const navItems = [
  { title: "Dashboard", url: "/", icon: HouseIcon },
  { title: "Animals", url: "/animals", icon: Dog },
  { title: "Scan logs", url: "/scan-logs", icon: scanText },
];

export const footerItems = [{ title: "User Profile", url: "/private" }];
