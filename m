From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 17 Feb 2018 18:42:19 +0100
Subject: [net-next PATCH v1 3/3] net: stmmac: dwmac-meson8b: make the
 clock configurations private
In-Reply-To: <1518885684.2883.111.camel@baylibre.com>
References: <20180217140820.30257-1-martin.blumenstingl@googlemail.com>
 <20180217140820.30257-4-martin.blumenstingl@googlemail.com>
 <1518885684.2883.111.camel@baylibre.com>
Message-ID: <CAFBinCDxhg-h8vcAb9Gabxa5sqeaZvpU5QtE4ShvvUKYYx_59Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

On Sat, Feb 17, 2018 at 5:41 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Sat, 2018-02-17 at 15:08 +0100, Martin Blumenstingl wrote:
>> The common clock framework needs access to the "clock configuration"
>> structs during runtime.
>> However, only the common clock framework should access these. Ensure
>> this by moving the configuration structs out of struct meson8b_dwmac,
>> so only meson8b_init_rgmii_tx_clk() and the common clock framework know
>> about these configurations.
>>
>> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
thank you reviewing this!

>> ---
>>  .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 45 ++++++++++++----------
>>  1 file changed, 24 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> index 0dfce35c5583..2d5d4aea3bcb 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> @@ -49,19 +49,17 @@
>>
>>  struct meson8b_dwmac {
>>         struct device           *dev;
>> -
>>         void __iomem            *regs;
>> -
>>         phy_interface_t         phy_mode;
>> +       struct clk              *rgmii_tx_clk;
>> +       u32                     tx_delay_ns;
>> +};
>>
>> +struct meson8b_dwmac_clk_configs {
>
> Not too sure we needed a struct for this, but it does work and does not matter
> much
I tried it without this struct: this resulted in even more code
because every struct clk_* would have to be devm_kzalloc()'ed, along
with a "if (!result) return -ENOMEM" (which makes it 3 lines per
struct clk_*)
either way: it's still an improvement as per commit message

>>         struct clk_mux          m250_mux;
>>         struct clk_divider      m250_div;
>>         struct clk_fixed_factor fixed_div2;
>>         struct clk_gate         rgmii_tx_en;
>> -
>> -       struct clk              *rgmii_tx_clk;
>> -
>> -       u32                     tx_delay_ns;
>>  };
>

Regards
Martin
