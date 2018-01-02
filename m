From: marcel@holtmann.org (Marcel Holtmann)
Date: Tue, 2 Jan 2018 12:19:27 +0100
Subject: [RFC v2 7/9] bluetooth: btrtl: load the config blob from
 devicetree when available
In-Reply-To: <CAL9uMOEMDup4hRkxD-tM8R0YirGs5uQi31AjJUnFCPNMKUdRHg@mail.gmail.com>
References: <20180101204217.26165-1-martin.blumenstingl@googlemail.com>
 <20180101204217.26165-8-martin.blumenstingl@googlemail.com>
 <563D6F9F-8495-40D4-BE56-5338ED2B9B99@holtmann.org>
 <CAL9uMOEMDup4hRkxD-tM8R0YirGs5uQi31AjJUnFCPNMKUdRHg@mail.gmail.com>
Message-ID: <E8E39477-CF1A-4A3E-84C5-830E182C2266@holtmann.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Carlo,

>>> Some Realtek bluetooth devices need a "config" blob. The btrtl driver
>>> currently only allows loading this config blob via the request_firmware
>>> mechanism.
>>> 
>>> The UART Bluetooth chips use this config blob to specify the baudrate,
>>> whether flow control is used and some other unknown bits. This means
>>> that the config blob is board-specific - thus loading it via
>>> request_firmware means that the rootfs is tied to a specific board.
>>> 
>>> The UART Bluetooth chips are implemented through serdev. This means
>>> there is also a devicetree node which describes the Bluetooth chip.
>>> Thus we can also load the blob from the devicetree node to keep the
>>> filesystem independent of any board configuration data. In the future
>>> this could be extended to support ACPI as well (in case that's needed).
>>> 
>>> Parse the devicetree node if it exists and obtain the config blob from
>>> there. Otherwise fall back to using the "old" request_firmware
>>> mechanism.
>> 
>> where are these config blobs coming from? I think we also need to give people a helping hand on how to add them to DT. I still wonder if the only pieces we are using are the UART config, then maybe skipping the config blob and allowing for clear named values in DT might be better.
> 
> What about x86 platforms where we do not have DT (I didn't check but I
> don't think that the UART config in that case is shipped in the ACPI
> tables)?

if we have this hardware in x86 systems, then I would really like to see ACPI table dumps. Some pieces might need hardcoding based on ACPI ID.

Regards

Marcel
