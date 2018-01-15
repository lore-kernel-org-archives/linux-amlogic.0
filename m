From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 15 Jan 2018 13:04:50 +0100
Subject: [RFT net-next v4 1/5] net: stmmac: dwmac-meson8b: only configure
 the clocks in RGMII mode
In-Reply-To: <1516016791.2608.12.camel@baylibre.com>
References: <20180114214858.7217-1-martin.blumenstingl@googlemail.com>
 <20180114214858.7217-2-martin.blumenstingl@googlemail.com>
 <1516016791.2608.12.camel@baylibre.com>
Message-ID: <CAFBinCDJVG6rMqh3CjTtHhtVxWi_Y426AksyNtSsa2xKhgjn_w@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

On Mon, Jan 15, 2018 at 12:46 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Sun, 2018-01-14 at 22:48 +0100, Martin Blumenstingl wrote:
>>
>
> [...]
>
>> @@ -204,12 +200,24 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
>>
>>               meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK,
>>                                       tx_dly_val << PRG_ETH0_TXDLY_SHIFT);
>> +
>> +             ret = clk_prepare_enable(dwmac->m25_div_clk);
>> +             if (ret) {
>> +                     dev_err(&dwmac->pdev->dev, "failed to enable the PHY clock\n");
>> +                     return ret;
>> +             }
>> +
>> +             /* Generate the 25MHz RGMII clock for the PHY */
>> +             ret = clk_set_rate(dwmac->m25_div_clk, 25 * 1000 * 1000);
>> +             if (ret) {
>> +                     clk_disable_unprepare(dwmac->m25_div_clk);
>> +
>> +                     dev_err(&dwmac->pdev->dev, "failed to set PHY clock\n");
>> +                     return ret;
>> +             }
>>               break;
>>
>>       case PHY_INTERFACE_MODE_RMII:
>> -             /* Use the rate of the mux clock for the internal RMII PHY */
>> -             clk_rate = clk_get_rate(dwmac->m250_mux_clk);
>> -
>>               /* disable RGMII mode -> enables RMII mode */
>>               meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_RGMII_MODE,
>>                                       0);
>> @@ -231,20 +239,6 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
>>               return -EINVAL;
>>       }
>>
>> -     ret = clk_prepare_enable(dwmac->m25_div_clk);
>> -     if (ret) {
>> -             dev_err(&dwmac->pdev->dev, "failed to enable the PHY clock\n");
>> -             return ret;
>> -     }
>> -
>> -     ret = clk_set_rate(dwmac->m25_div_clk, clk_rate);
>> -     if (ret) {
>> -             clk_disable_unprepare(dwmac->m25_div_clk);
>> -
>> -             dev_err(&dwmac->pdev->dev, "failed to set PHY clock\n");
>> -             return ret;
>> -     }
>> -
>
> I would set the rate first then enable. Less chances of glitches and no need to
> call clk_disable_unprepare if it fails
I did swap the calls in PATCH #3 of this series
with this patch I wanted to make sure that all of the current logic is
only executed in RGMII mode

>>       /* enable TX_CLK and PHY_REF_CLK generator */
>>       meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TX_AND_PHY_REF_CLK,
>>                               PRG_ETH0_TX_AND_PHY_REF_CLK);
>> @@ -294,7 +288,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>>                                &dwmac->tx_delay_ns))
>>               dwmac->tx_delay_ns = 2;
>>
>> -     ret = meson8b_init_clk(dwmac);
>> +     ret = meson8b_init_rgmii_tx_clk(dwmac);
>>       if (ret)
>>               goto err_remove_config_dt;
>>
>> @@ -311,7 +305,8 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>>       return 0;
>>
>>  err_clk_disable:
>> -     clk_disable_unprepare(dwmac->m25_div_clk);
>> +     if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
>> +             clk_disable_unprepare(dwmac->m25_div_clk);
>>  err_remove_config_dt:
>>       stmmac_remove_config_dt(pdev, plat_dat);
>>
>> @@ -322,7 +317,8 @@ static int meson8b_dwmac_remove(struct platform_device *pdev)
>>  {
>>       struct meson8b_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
>>
>> -     clk_disable_unprepare(dwmac->m25_div_clk);
>> +     if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
>> +             clk_disable_unprepare(dwmac->m25_div_clk);
>
> if you use
> devm_add_action_or_reset(dev, (void(*)(void *))clk_disable_unprepare,
> ?                        YOUR-CLK)
>
> after enabling the clock, your can discard these conditional hunks.
noted, I'll also make this part of the clock cleanup series

>>
>>       return stmmac_pltfr_remove(pdev);
>>  }
>
