# 🎈 App Intents + Spotlight Demo with Custom Shortcuts

A Swift demo project showcasing how to build **dynamic App Shortcuts** using `AppIntents`, integrate them with **Spotlight Search**, and personalize them with **custom icons** (e.g., balloons).  
This project demonstrates clean architecture with dependency injection and persistent shortcut storage.

---

## 🚀 What This Demo Covers

- ✅ iOS 16+ App Intents usage  
- ✅ Spotlight integration with `AppEntity` and custom images  
- ✅ Dynamic shortcut generation using mock models  
- ✅ Persistence with `UserDefaults`  
- ✅ Thematic shortcut icons (Red, Green, Blue balloons)  
- ✅ Modular code with protocol-based dependency injection  

---

## 🧠 How It Works

1. `DKAppIntentModel` defines shortcut data (`UUID`, name, image name)  
2. `DKAppEntity` conforms to `AppEntity`, enabling Spotlight visibility  
3. `DKAppIntent` is triggered when the user selects a shortcut  
4. `DKShortcutsHandler` initializes and stores balloon shortcut models  
5. `DKAppEntityManager` persists data using `UserDefaults`  
6. `DisplayRepresentation` is used to show custom icons in Spotlight

---

## 🎨 Custom Icons

Balloon-themed icons are used to represent each shortcut.

```
DisplayRepresentation(
    title: "\(model.name)",
    image: .init(named: model.imageIdentifier)
)
```

---

## 💉 Dependency Injection

A protocol `DKAppEntityManagerProtocol` is used to enable testable and decoupled logic.  
It is injected like this:

```
let handler = DKShortcutsHandler(entityManager: DKAppEntityManager.shared)
handler.initializeShortcuts()
```
---

## 📱 How to Use the Demo

Follow these steps to test the demo and see your shortcuts in action:

1. **Launch the App**
   - It initializes three balloon shortcuts: Red, Green, and Blue

2. **Trigger a Shortcut**
   - Open the Shortcuts app or pull down on the home screen to use Spotlight
   - Search for one of the shortcuts: e.g., `"Red Balloon"`

3. **Tap to Execute**
   - The shortcut appears with its custom icon and name
   - Tapping it triggers the `AppIntent` (via deep link or simulated action)

## 🖼 Demo Preview
![Shortcuts Demo](https://github.com/user-attachments/assets/b7c54669-1aae-4622-b9c5-34697753199f)
