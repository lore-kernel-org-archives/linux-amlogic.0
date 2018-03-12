From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 12 Mar 2018 22:00:17 +0100
Subject: [RFC PATCH] ARM: dts: meson8b-odroidc1: add microSD support
In-Reply-To: <CAFBinCA8eWBEqeJCM3La0sm1BvMNkKjbxfZ5GA2sEzXb4AN=8w@mail.gmail.com>
References: <20180125042313.20927-1-linus.luessing@c0d3.blue>
 <CAFBinCA8eWBEqeJCM3La0sm1BvMNkKjbxfZ5GA2sEzXb4AN=8w@mail.gmail.com>
Message-ID: <CAFBinCDZCkrB2aWvjtwaF-DSa5Zs_gmDKei_+wB4g3nxau8kbg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Linus,

On Sun, Jan 28, 2018 at 9:33 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Hi Linus,
>
> thank you for this patch!
>
> On Thu, Jan 25, 2018 at 5:23 AM, Linus L?ssing <linus.luessing@c0d3.blue> wrote:
>> The Odroid C1 features a microSD slot. This patch adds the necessary
>> DT bindings to support it.
>>
>> Signed-off-by: Linus L?ssing <linus.luessing@c0d3.blue>
>> ---
>> This patch only worked after Martin's attempt to fix the pinctrl issues
>> for meson8b:
>>
>> https://patchwork.kernel.org/patch/10181185/
> unfortunately that patch requires more work
the proper fix is now queued for v4.17

>> Another note: I was seeing the following error message in dmesg after
>> writing a 64MB file to the microSD card and right after typing "$ sync":
>>
>> [  512.584687] mmcblk0: error -84 sending status command, retrying
>> [  512.586985] mmcblk0: timed out sending r/w cmd command, card status 0xd00
>> [  512.591756] mmcblk0: status not valid, retrying timeout
>>
>> However read/write operations seemed unaffected. The file seemed fine
>> afterwards, even after unmounting, replugging and remounting the microSD
>> card.
>>
>> Not sure whether this error message could potentially point to some
>> error in the changes in here.
> these errors may be a problem with the meson-mx-sdio (MMC) driver
> can you please show the output of /sys/kernel/debug/mmc0/ios ?
some users on IRC have successfully tested this patch (together with
the two patches from my series which fix the GPIO handling)
can you please re-send this patch so Kevin can queue it for the next
development cycle?

>>
>>  arch/arm/boot/dts/meson8b-odroidc1.dts | 58 ++++++++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/meson8b.dtsi         |  8 +++++
>>  2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
>> index d5e83051bb54..3a5603d95b70 100644
>> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
>> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
>> @@ -54,6 +54,7 @@
>>
>>         aliases {
>>                 serial0 = &uart_AO;
>> +               mmc0 = &sd_card_slot;
>>         };
>>
>>         memory {
>> @@ -69,6 +70,37 @@
>>                         default-state = "off";
>>                 };
>>         };
>> +
>> +       tflash_vdd: regulator-tflash_vdd {
>> +               /*
>> +                * signal name from schematics: TFLASH_VDD_EN
>> +                */
>> +               compatible = "regulator-fixed";
>> +
>> +               regulator-name = "TFLASH_VDD";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +
>> +               gpio = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
>> +               enable-active-high;
>> +       };
>> +
>> +       tf_io: gpio-regulator-tf_io {
>> +               compatible = "regulator-gpio";
>> +
>> +               regulator-name = "TF_IO";
>> +               regulator-min-microvolt = <1800000>;
>> +               regulator-max-microvolt = <3300000>;
>> +
>> +               /*
>> +                * signal name from schematics: TF_3V3N_1V8_EN
>> +                */
>> +               gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
>> +               gpios-states = <0>;
>> +
>> +               states = <3300000 0
>> +                         1800000 1>;
>> +       };
>>  };
>>
>>  &uart_AO {
>> @@ -100,6 +132,32 @@
>>         status = "okay";
>>  };
>>
>> +&sdio {
>> +       status = "okay";
>> +
>> +       pinctrl-0 = <&sd_b_pins>;
>> +       pinctrl-names = "default";
>> +
>> +       /* SD card */
>> +       sd_card_slot: slot at 1 {
>> +               compatible = "mmc-slot";
>> +               reg = <1>;
>> +               status = "okay";
>> +
>> +               bus-width = <4>;
>> +               no-sdio;
>> +               cap-mmc-highspeed;
>> +               cap-sd-highspeed;
>> +               disable-wp;
>> +
>> +               cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
>> +               cd-inverted;
>> +
>> +               vmmc-supply = <&tflash_vdd>;
>> +               vqmmc-supply = <&tf_io>;
>> +       };
>> +};
>> +
>>  &ethmac {
>>         status = "okay";
>>
>> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
>> index fa5274aa370b..87687c09ca3f 100644
>> --- a/arch/arm/boot/dts/meson8b.dtsi
>> +++ b/arch/arm/boot/dts/meson8b.dtsi
>> @@ -206,6 +206,14 @@
>>                                 function = "ethernet";
>>                         };
>>                 };
>> +
>> +               sd_b_pins: sd-b {
>> +                       mux {
>> +                               groups = "sd_d0_b", "sd_d1_b", "sd_d2_b",
>> +                                       "sd_d3_b", "sd_clk_b", "sd_cmd_b";
>> +                               function = "sd_b";
>> +                       };
>> +               };
>>         };
>>  };
>>
>> --
>> 2.11.0
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>
>
> Regards
> Martin



Regards
Martin
