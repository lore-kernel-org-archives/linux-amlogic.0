Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89722606A327
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 17:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uF3hF9Hf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9sB5WX+BUrs8pWmuNbAmYri8u7q6OWtDH/bCoCE6vYQ=; b=uF3hF9Hf4d3ZGTq1K/eVc6C+6r
	jwPmEcUxt6j1rryl/8aDfw+zt/zmFy9mXO2OS9zJiWU0JYJqDXmRGqb3O+eewq03BwNkKM3OmVd0s
	/pe7r+ZYEXsUlBh3OR3w10FrDIoDytx1Y0dcbtKjRVx2+TSeJC6gduj/PIDbCHlvlbSJ5uAA39KqD
	g45A6Tad3B//jbDLzKZ66J+QuawKVbSRfrSPw8ZWSIEntF5mpQvepM85lWIk9rC+qdbhKfY3hvapb
	4Wt8e25zr0Qx7YmZYa+eAx6cJei9sQwqV0IIyOEwSDOPp5xKrSAK2XFhAgoAb88aCefCRQLI6w3HK
	TtjwIOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwvx-0000000EdyZ-0Xo3;
	Thu, 22 Oct 2026 17:50:33 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwvu-0000000Edvr-2BT4
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 17:50:31 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b060ec084so61455f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 10:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691428; x=1793296228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wd3oLS+dcFTXkdvGEDZ+0YYIQNbTTyKN39PEruh5N40=;
        b=S9o4T3kk6bIfT8Syxr5R8iUlJQDAhmIGNdBf07Qy2EPXO6nmxiMYM2yKcL4OenXo8M
         uRuGsiBiSsdYaplX/KvRZo9UKXtUvRgdtR+FKzlNb30aZI55jtzcv3jvOKsWtd2AbO0h
         OLpctmn1eMQKDW2m6Wyj1Cnd09EfmYekY4inAXeuGFjChehu33yFxRDkjVC3FJvN4Oee
         xzxezZXxb757Z4OqsOLPoCa+s1LdqNOfsbK82o1UutPiiWd67JZOJ1BXTB5g6SjAep2O
         yU4Q+/p3PGwZ6ah/o3VkX2NAzFpYEHpSqpo0eZMTzi2+om7LfNTAF7Jmu9xJQNYyctU8
         RCEQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/+agl9+KMGWEvsKw7reJJ/ztVbMvXjxzaasB0eUTQ3dEjBoJe3aazBdieO+Qm+fYKia/bp7ONr4qq44Ka@lists.infradead.org
X-Gm-Message-State: AFq9FYIFvBg+SZPgfOmE/Cm6ZLLJ9detA/dexDFPoj1Tf3hQpw8MIWcS
	FGSS2+2NQnVB4X9gWJ4BeVgtzDO10djiTF9HHJ54d/a3dOC7Jl4YXLBx
X-Gm-Gg: AYBFou2YIW5ezrdusY+IshPqzloeeQWkGdJZioHibgwKadp/mGiE2LR4pXTrPUwwZRx
	Ldh2WLrfPHDM99oXscy9z6iVYJtz9DKjScPdmwHanh8nlgLNIHdwRP5/vmX4nJhfcibm5mjVGx3
	ZuNNAGR0K2gt2u5US5XXODqT5lbxuRpp1QcvacatNY3YFjoJjkn9Qo0+UkDxMU0Uur2XPWCdan/
	CkJToEqhQw7A+fbeRQwb8CTSgVvust/ef/8mteBlyw6y8+OntO10NND8C4rufrbJlSDS1FI4HzY
	O6xPTx61tsRgTPw/1n/OL+OOsKvCFgH/iCjchTRwYYncUuCcujX9O5mYwxOX0FFvIg0Wu2CBtkK
	UZsm6btXHFYHwU+hbbazqNuvF8kjINDuQ4dBEJyLn4g4iSUcqoWkplIAyyyDUYRD6IvS5TUaE63
	nO+tWwlNP3RWUNmShj+ea5jRvxzySEkjrXXa1RU7iv2SCtjAQRsxavs738iNegT/94LSDLmxqEP
	/iWvoccE4POpJ+lFOALY6+NpOWgCb1j9FEtYqZxovtV4jmj9ikJM+vHmSUw8rECyht+UdxwfvvY
	liNPZF55+w==
X-Received: by 2002:a05:6000:1866:b0:48e:412:37f4 with SMTP id ffacd0b85a97d-48e2641de1amr14015136f8f.1.1792691428424;
        Thu, 22 Oct 2026 10:50:28 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835247sm13834966f8f.41.2026.10.22.10.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:50:27 -0700 (PDT)
Message-ID: <c9d2b1dd-c733-454a-9281-80787f5c432e@linux.com>
Date: Thu, 22 Oct 2026 18:50:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Jerome Brunet <jbrunet@baylibre.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-9-tanure@linux.com>
 <1jqzhu9in5.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <1jqzhu9in5.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_105030_587181_0080EF26 
X-CRM114-Status: GOOD (  15.89  )
X-Spam-Score: -0.7 (/)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/10/2026 08:14, Jerome Brunet wrote:
> On sam. 10 oct. 2026 at 11:59, Lucas Tanure <tanure@linux.com> wrote:
> 
>> The informative section explains in prose how phy-mode, the delay
>> properties in the MAC node and the mode handed to the PHY fit together,
>> and says itself that developers often get this wrong. A reader has to
>> work through several paragraphs before answering the one question they
>> usually have: for this phy-mode and these properties, which part adds
>> which delay.
>>
>> Add a table that answers it at a glance, with one row for every
>> combination the properties allow.
>>
>> Assisted-by: LLM
>> Signed-off-by: Lucas Tanure <tanure@linux.com>
>> ---
>>   .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> index 1bafd687dcb1..bba27a9feb61 100644
>> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> @@ -339,6 +339,24 @@ additionalProperties: true
>>   # has added. Failure to remove the delay will result in a
>>   # non-functioning link.
>>   #
>> +# Put together, with the two properties in the MAC node, this is who
>> +# adds each delay:
>> +#
>> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
>> +#   rgmii       -                     -                     PCB trace   PCB trace
>> +#   rgmii-id    -                     -                     PHY         PHY
>> +#   rgmii-id    present               -                     MAC         PHY
>> +#   rgmii-id    -                     present               PHY         MAC
>> +#   rgmii-id    present               present               MAC         MAC
>> +#   rgmii-txid  -                     -                     PHY         PCB trace
>> +#   rgmii-txid  present               -                     MAC         PCB trace
>> +#   rgmii-rxid  -                     -                     PCB trace   PHY
>> +#   rgmii-rxid  -                     present               PCB trace   MAC
>> +#
> 
> That would match how the HW is working on the A733 Allwinner too but I'm
> not entirely sure this is what Andrew had in mind from our previous
> discussion [1]. Adding him to the thread
> 
> [1]: https://lore.kernel.org/linux-sunxi/491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch/
> 
>> +# A property for a clock the PCB already delays is not in this table.
>> +# It is either the fine tuning described next, or a mistake the MAC
>> +# should report as a fatal error.
>> +#
>>   # Sometimes there is a need to fine tune the delays. Often the MAC or
>>   # PHY can perform this fine tuning. In the MAC node, the Device Tree
>>   # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
> 
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
> 

Thanks, But I will drop this as it is wrong.
Lucas

>> -- 
>> 2.56.0
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
