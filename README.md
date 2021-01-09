# ServerBasedRendering
Use server rest API responds to build multiple views on a screen. Taking advantage of declarative UI from SwiftUI and implements it together with the factory method pattern.

The main feature of this design are:
Rearranging UI position without pushing an app update to the app store.
Easily update views by modifying the JSON response.

### How does it work?

Initially, split the app view into groups. Splitting each view as a template that consists of a variety of organisms helps me. This organism is created by molecules, a molecule comprises of atoms.
reference: https://atomicdesign.bradfrost.com/chapter-2/

We then can easily create a factory pattern function to create the molecules or organism. Combining the organisms then we can create a template, This will define what our templates would look like. 

After building this project I can suggest that this pattern would work on a simple view that changes often - i.e. views that rely on daily events, deals, etc. Building a whole app based on this would make it hard to grow the architecture as well as the need to reassure backward compatibility.

### Reference: 
https://theswiftdev.com/whats-new-in-vapor-4/
https://github.com/AnupAmmanavar/SwiftUI-Server-Driver-UI
http://tom.lokhorst.eu/2020/07/server-driven-ui
https://atomicdesign.bradfrost.com/chapter-2/
https://www.youtube.com/watch?v=uq6KBsDt8tI&t=205s
https://atomicdesign.bradfrost.com/chapter-2/
