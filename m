From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 15 Jan 2018 13:02:14 +0100
Subject: [RFT net-next v4 2/5] net: stmmac: dwmac-meson8b: simplify
 generating the clock names
In-Reply-To: <1516016807.2608.13.camel@baylibre.com>
References: <20180114214858.7217-1-martin.blumenstingl@googlemail.com>
 <20180114214858.7217-3-martin.blumenstingl@googlemail.com>
 <1516016807.2608.13.camel@baylibre.com>
Message-ID: <CAFBinCCMaV+KO2dNAUFqoYSLtg10-QR_mvY1vTgDgB3iHzf3kw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

On Mon, Jan 15, 2018 at 12:46 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Sun, 2018-01-14 at 22:48 +0100, Martin Blumenstingl wrote:
>> Instead of using a custom buffer, snprintf() and devm_kstrdup() we can
>> simplify this by using devm_kasprintf().
>> No functional changes - this just makes the code shorter.
>
> CCF copies the name from the init_data to its own structures, so the init_data
> are useless after the register.
>
> Here you'd allocate memory for each string which will remain until the driver
> unload. It's not much, but still, it is wasted memory.
good catch, thank you!
maybe I should drop this patch for now and clean up the clock
registration in another series - I can try to get rid of the
"unneeded" members in struct meson8b_dwmac in a new patch. what do you
think?

>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 13 ++++++-------
>>  1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> index c6f87e9c4ccb..670f344f7168 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> @@ -86,7 +86,6 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
>>       struct clk_init_data init;
>>       int i, ret;
>>       struct device *dev = &dwmac->pdev->dev;
>> -     char clk_name[32];
>>       const char *clk_div_parents[1];
>>       const char *mux_parent_names[MUX_CLK_NUM_PARENTS];
>>       static const struct clk_div_table clk_25m_div_table[] = {
>> @@ -113,8 +112,8 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
>>       }
>>
>>       /* create the m250_mux */
>> -     snprintf(clk_name, sizeof(clk_name), "%s#m250_sel", dev_name(dev));
>> -     init.name = clk_name;
>> +     init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#m250_sel",
>> +                                dev_name(dev));
>>       init.ops = &clk_mux_ops;
>>       init.flags = 0;
>>       init.parent_names = mux_parent_names;
>> @@ -132,8 +131,8 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
>>               return PTR_ERR(dwmac->m250_mux_clk);
>>
>>       /* create the m250_div */
>> -     snprintf(clk_name, sizeof(clk_name), "%s#m250_div", dev_name(dev));
>> -     init.name = devm_kstrdup(dev, clk_name, GFP_KERNEL);
>> +     init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#m250_div",
>> +                                dev_name(dev));
>>       init.ops = &clk_divider_ops;
>>       init.flags = CLK_SET_RATE_PARENT;
>>       clk_div_parents[0] = __clk_get_name(dwmac->m250_mux_clk);
>> @@ -151,8 +150,8 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
>>               return PTR_ERR(dwmac->m250_div_clk);
>>
>>       /* create the m25_div */
>> -     snprintf(clk_name, sizeof(clk_name), "%s#m25_div", dev_name(dev));
>> -     init.name = devm_kstrdup(dev, clk_name, GFP_KERNEL);
>> +     init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#m25_div",
>> +                                dev_name(dev));
>>       init.ops = &clk_divider_ops;
>>       init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
>>       clk_div_parents[0] = __clk_get_name(dwmac->m250_div_clk);
>
