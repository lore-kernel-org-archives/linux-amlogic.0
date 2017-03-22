From: hgkr.klein@gmail.com (Helmut Klein)
Date: Wed, 22 Mar 2017 19:20:14 +0100
Subject: meson_uart: enabling the core clock for uart_A
In-Reply-To: <CAOQ7t2Z+HdqBQxSWCZ5CRkrVFVz3TnUBaxO3mUmam24PAdWS0Q@mail.gmail.com>
References: <a415ddf8-ad5d-39bb-272b-f10589cf9963@gmail.com>
 <CAOQ7t2Z+HdqBQxSWCZ5CRkrVFVz3TnUBaxO3mUmam24PAdWS0Q@mail.gmail.com>
Message-ID: <72262208-78cc-1dd7-1162-efdc553a7736@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 22.03.2017 18:22, Carlo Caione wrote:
> On Wed, Mar 22, 2017 at 5:58 PM, Helmut Klein <hgkr.klein@gmail.com> wrote:
>> Hallo Carlo,
>>
>> the u-boot of my s905 based media player (netxeon minimx, p200 compatible)
>> doesn't enable the core clock for uart_A. therefore my bluetooth adapter,
>> which is connected to this device, isn't operational.
>
> weird. Which kernel are you using?

i dont think it's weird. all the none AO uarts have clock gating bits. 
Without enabling the clock, the device is not operational (see chapter 
22.3 of the bloody s905 public datasheet). I'm using kevin hilmans 
integration branch = v4.11-rc1

>
>> i've added some lines, extracted from amlogic's driver, to meson_uart.c and
>> modified the clock header files, to be able to add the core clock info to
>> the dtb.
>>
>> May i send you the patches?
>
> Send the patches to the Amlogic ML.

i will setup the patches like yours for the hwrng (or at least i will 
try it)

>
>> if yes, which git tree should i use as the base?
>
> Probably the integration branch is the better choice
> https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git
>
> Cheers,
>

Helmut
