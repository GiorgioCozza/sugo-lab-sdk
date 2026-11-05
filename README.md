# Sugo Lab SDK

Libreria di moduli Luau e prefab da riusare in più esperienze Roblox. Il progetto Rojo alla radice è un banco di prova della libreria.

| Cartella | Contenuto |
| --- | --- |
| `src/shared/` | Moduli disponibili a client e server. `Cooldown` limita la frequenza di un'azione per istanza. |
| `assets/prefabs/` | Prefab da clonare. `CheckpointPad` è una pedana visiva a cui il gioco può associare la propria logica. |
| `demo/` | Anteprima e verifiche minime, da eseguire in Studio. |

## Provare la libreria

Con [Rojo 7](https://rojo.space/docs/v7/getting-started/installation/) e Roblox Studio installati, esegui da questa cartella in PowerShell:

```powershell
New-Item -ItemType Directory -Force build | Out-Null
rojo build default.project.json -o build/RobloxCommonDemo.rbxlx
```

Apri il place generato in Studio e premi **Play**. In Output deve comparire `[RobloxCommonDemo] Cooldown e prefab verificati` e in Workspace deve apparire `CheckpointPad`.

## Usarla in un gioco

Tieni una copia della libreria sotto `vendor/sugo-lab-sdk/` nel repository del gioco e registra nel gioco la revisione importata. Aggiungi il nodo seguente sotto `ReplicatedStorage` nell'albero del progetto Rojo del gioco. I percorsi sono relativi al file di progetto.

```json
"RobloxCommon": {
  "$className": "Folder",
  "Shared": { "$path": "vendor/sugo-lab-sdk/src/shared" },
  "Assets": { "$path": "vendor/sugo-lab-sdk/assets/prefabs" }
}
```

`Cooldown.new(2)` crea un limite di due secondi. Usa `handle.tryUse(os.clock())` al momento dell'azione. Per azioni con effetto sul gioco, conserva e verifica il cooldown sul server, con un'istanza per giocatore e azione.

Aggiorna la copia a una revisione esplicita e prova il gioco prima di integrare l'aggiornamento. Per modifiche riutilizzabili, intervieni prima qui e poi aggiorna le copie dei giochi.

## Contribuire

- Aggiungi qui solo componenti che possono funzionare senza riferimenti a un gioco specifico.
- Usa Luau con `--!strict` per i nuovi moduli. Il contenuto di `ReplicatedStorage` è accessibile al client. Tieni la logica e i dati riservati del server in percorsi separati.
- Per prefab semplici usa `.model.json`. Per modelli esportati da Studio, preferisci `.rbxmx` quando la revisione testuale è utile. Conserva i file sorgente esterni a `assets/prefabs/`.
- Per ogni asset importato, registra fonte, licenza e, se serve, ID Roblox e proprietario. Prima di distribuirlo, verifica che i giochi destinatari possano usarlo.
