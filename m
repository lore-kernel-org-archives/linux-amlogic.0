Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8CC606A319
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3XwxSSCo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dRjTC6ib
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M0cvX2jD3/+ots4qjtAD/U4Zf7CV7Ixh3/yjD6pYLDo=; b=3XwxSSCouFoIVmY+thAgP0D9pu
	QJDRrxiZDvNvf/f7JYfXSLsHQAL/Nk445PbcuSsWRvRRLTQgx0I3GIsdO6aEH+NHTBNItGhwJ6bXu
	bOoyyAfTJLAqkHl+s/OFUqteWQdUy4kmbA2ri5auP9KGZGD803NDulgAPubLi9iOWhZu7VDeVE0Yb
	6Um6ncV0vqfWsCrYlZWfcExTG+pvw66mp9uoP0ZqcNfmz0aQZBHwwbM0dCBtIOtzmZS48sZPm1Ig3
	sl1J2X9rbriTm/FeBNaS2x8YgseG2qf6e0XohbqUBLCGaAK1185jR8q+pqKSDRi85EVQvtrdMYJ2+
	Jp4U2Ccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwjJ-0000000Eazz-3adA;
	Thu, 22 Oct 2026 17:37:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwjI-0000000Eayx-0uoV
	for linux-amlogic@bombadil.infradead.org;
	Thu, 22 Oct 2026 17:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=90PpyRvqw50zWmq9+jh1atWjcGYKGRTrDoZ7I20u5a0=; b=dRjTC6ibYAgwn3aMP3AqU7qI9q
	8Wz9Nl6rv9DXI6Arw4mzGJ6bUgtKX5EQq4ZcLWwGHzsE5F75ydRJwofxwhJ0F0YXm4O229rJURZXO
	fjSwf/dlo2w99Cd9fj1UPBN+kf8foQkVqucQRpa7uAOIUyTDy34l7fxHp6B72CQGRpWweGvweweM4
	2kO0T5Kl/Wc8ecngDWiWM6/uq671asurE4J4Ca17jR0g8wCqY+IGuGZafMytuirAy5FZrUx8hY3PI
	/FXJlghdfgDLBWzHauePOzsGwCS5gTdTz74ohYBDzTBM/VwYhfnlPX4B8rSmiCojrJKh9ffFRQAOm
	303/GX/w==;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwjE-00000007dYr-0x7K
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 17:37:26 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df54150dfso31321f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 10:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690641; x=1793295441;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90PpyRvqw50zWmq9+jh1atWjcGYKGRTrDoZ7I20u5a0=;
        b=fKeutpYkLwIyrbtlo0hP0r7R9RjKiTIsMPS5Zjvdh7/iRFMkng/FNxU6cWn0wjiERP
         75l4oc3rciL+ucQqJKz1+wyNPd3tZbbj09fHRrWsKfly7cE4pRlGwkDGB/O2o7WMr0aV
         RFLM6bE0gpYct7x16HqDwfwDECMbq4ssPRxk09b9rk5nDTIld5TprVwqZU3eY8rfbQZ4
         i81vkU3vlE6ISP4mCcjr6RzdGoJVJdhjDSgR/CYU1YebpHPGcTTY5KHzYCCNQOmHWDzy
         ydWi9/BF0JgvTVhojHDUM6inYHOC48O3tJNZNu4yAzjFA0gIXMvPNDCas0Ee1sHlhU41
         h8eg==
X-Forwarded-Encrypted: i=1; AKwUvBwjVjdTplRe1tn5v2uDR18CkVhv0eWl9QIj6UWOvnWkWQtFXqhY2IvePOdNMcxXZ86WNFTky2d3ypLXErXp@lists.infradead.org
X-Gm-Message-State: AFq9FYKTF8wDVtyD+p9lIkKCpbJTQHn6iCvM84vuqKXm9n1k4piTJYxp
	LWWCO/YRggZY7Sr8S5oCMTLlh/Hu8RUefW/Nlxjlvldp94OLK8q/HeEm
X-Gm-Gg: AYBFou2KnFphkDmBHhublmVQDeDHm8YELxa339tr/nAKhn4q5JiSuJRwu4ae9tTAw/t
	I310JNTgSR3XVhzoPRplMR4EjwN7SRvgGcVIIV+Q5886lrshd0mAX9xC2JB4BGXJM/pGEkjraCu
	UDDJOFwp/HekvC2jYbng8fBFP+sM6iWVJdlLf0bAoySyXSZa+eyo7E6iF7Fg6lRcKSNbrGXIXnx
	SzTEqRDX0pIZb6/bOVwThgxbuEN99jEUkRlBidJ0iNPBpaoGL5F6IZD/bOxdT5FsPHnfC6LK9h6
	w8XarxJYLfYp9NoJRnWqaZ9a8MjrDZgHYSADx6ieU1jov6VSvcaJEQTyDWTgAmpsb8k80rqzW72
	N4l4657NWSONNlVtqGkGPreSYvkv5MRI5U0w5UL8gsSZ+LizD73ARtCTQNJrqk6Rdizicc1r1nn
	eYrsgiVlNgdLAUUXd7VyuJZT7rLqZ9HyTjxTF5MYv9bFOF/t3zGHk+b8P0vuMMvQlNSLjhnoBLf
	dWigxDYaB/kf6YsQQnKD4XTLmkJAeyd9q/NcC5Je3UHbDkD0RyxYNuwQTnnWwu7Z7jdebSNSMeb
	P7pL4itnHHxUMvrZC4mdvTusGq5/sPZG
X-Received: by 2002:a05:6000:4e:b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-48e264f2be7mr9021652f8f.35.1792690640831;
        Thu, 22 Oct 2026 10:37:20 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm13391825f8f.1.2026.10.22.10.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:37:20 -0700 (PDT)
Message-ID: <00b94eed-fe1b-4cf3-a4ed-12813faacb86@linux.com>
Date: Thu, 22 Oct 2026 18:37:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-5-tanure@linux.com>
 <a1c0b76b-7b67-43e9-af15-3139f17d7fe7@lunn.ch>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <a1c0b76b-7b67-43e9-af15-3139f17d7fe7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_183725_142154_BEFE0118 
X-CRM114-Status: GOOD (  34.96  )
X-Spam-Score: 1.2 (+)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/10/2026 13:30, Andrew Lunn wrote:
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> @@ -82,6 +82,7 @@ struct meson8b_dwmac_data {
>>   	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
>>   	bool has_prg_eth1_rgmii_rx_delay;
>>   	bool has_pipeline_clk;
>> +	bool mac_applies_dt_delays;
> 
> Please can you invert this and call it broken delays.
> 
> We should make it clear that new devices should not set this, because
> it wrong, broken.

Moved to a function for T7. And the previous SoCs have their own 
function which gets a comment that new SoCs must not use it.

> 
>> +static int meson_dwmac_init_dt_delays(struct meson8b_dwmac *dwmac,
>> +				      struct plat_stmmacenet_data *plat_dat)
>> +{
>> +	struct device_node *np = dwmac->dev->of_node;
>> +	u32 tx_delay_ps = 0, rx_delay_ps = 0;
>> +	phy_interface_t phy_mode;
>> +	bool mac_tx, mac_rx;
>> +
>> +	mac_tx = !of_property_read_u32(np, "tx-internal-delay-ps", &tx_delay_ps);
>> +	mac_rx = !of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps);
>> +
>> +	/* one step is a quarter of the RGMII clock period, 2ns at 1Gbit/s */
>> +	if (tx_delay_ps > 6000 || tx_delay_ps % 2000)
>> +		return dev_err_probe(dwmac->dev, -EINVAL,
>> +				     "The RGMII TX delay must be 0, 2000, 4000 or 6000ps\n");
> 
> tx-internal-delay is not listed in amlogic,meson-dwmac.yaml. Please
> could you add it, and list the valid values.
Patch 2 of this series adds it to the T7 block with the valid values.
That changes in v4, see below.
> 
> Do you have access to the datasheet? Could you check these numbers are
> correct, because they are larger than typical. 4ns, and 6ns makes no
> sense, the RGMII standard only calls for 2ns.

Yes. The field is not a delay line. It selects the phase of the TX
clock sent to the PHY: 0, 1/4, 1/2 or 3/4 of the clock period. At
1Gbit/s that is 0, 2, 4 or 6ns, which is where the numbers come from
(the existing amlogic,tx-delay-ns property lists the same four). Only
1/4 is a usable RGMII delay; 1/2 is an inverted clock and 3/4 is a 2ns
lead. And since it is a fraction of the period, the 2ns is only true at
1Gbit/s, at 100Mbit/s the same setting is 10ns. I agree 4000 and 6000
make no sense.

> 
>> +
>> +	/* the RX delay line moves in 200ps steps and reaches 3000ps */
>> +	if (rx_delay_ps > 3000 || rx_delay_ps % 200)
>> +		return dev_err_probe(dwmac->dev, -EINVAL,
>> +				     "The RGMII RX delay range is 0..3000ps in 200ps steps\n");
> 
> Please could you listing these values in the binding.
> 
> Also, mark that amlogic,tx-delay-ns & amlogic,rx-delay-ns are not
> valid for this compatible.
The RX values are in patch 2 as well, the T7 shares the G12A list
(0..3000ps in 200ps steps); v4 drops the 0. The two vendor properties
are already rejected for the T7: they are only defined for the older
compatibles and the schema has unevaluatedProperties: false. v4 adds an
explicit "false" for both in the T7 block so that it is visible.
> 
>> +
>> +	phy_mode = phy_fix_phy_mode_for_mac_delays(dwmac->phy_mode, mac_tx,
>> +						   mac_rx);
> 
> This is not correct. This function assumes mac_tx and mac_rx are
> Boolean values, the MAC is applying the full 2ns delay. However, if
> rx-internal-delay-ps is only providing 200ps, that is not true.
> 
> I would prefer you keep to the usual way of doing things. Allow the
> MAC to apply small tuning delays, but have the PHY do the 2ns. So
> don't make any modification to phy-mode.
> 

OK. v4 does not touch phy-mode. rx-internal-delay-ps becomes the tuning
the MAC adds on top, 200..3000ps. On the TX side the T7 has nothing
small to offer, the only step is the 2ns phase, so v4 does not accept
tx-internal-delay-ps on the T7 at all, in the binding and in the
driver. The VIM4 then uses plain rgmii-id with the PHY adding both
delays. That also removes the wrong claim in patch 7 that the RTL8211F
TX delay does not work; the real cause was a bootloader value left in
the glue register, details in my reply to Martin on patch 7.
>>   static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>>   {
>>   	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
>> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>>   	dwmac->dev = &pdev->dev;
>>   	dwmac->phy_mode = plat_dat->phy_interface;
>>   
>> -	/* use 2ns as fallback since this value was previously hardcoded */
>> -	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
>> -				 &dwmac->tx_delay_ns))
>> -		dwmac->tx_delay_ns = 2;
>> -
>> -	/* RX delay defaults to 0ps since this is what many boards use */
>> -	if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
>> -				 &dwmac->rx_delay_ps)) {
>> -		if (!of_property_read_u32(pdev->dev.of_node,
>> -					  "amlogic,rx-delay-ns",
>> -					  &dwmac->rx_delay_ps))
>> -			/* convert ns to ps */
>> -			dwmac->rx_delay_ps *= 1000;
>> -	}
>> -
>> -	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
>> -		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
>> -			dev_err(dwmac->dev,
>> -				"The RGMII RX delay range is 0..3000ps in 200ps steps");
>> -			return -EINVAL;
>> +	if (!dwmac->data->mac_applies_dt_delays) {
> 
> I suggest you do this at a higher level. Either call this function if
> _broken_delay is set, or the other one.

Done through the callback. Probe makes one call, and the parsing of the
vendor properties moves into the older function.
> 
> 	Andrew


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
