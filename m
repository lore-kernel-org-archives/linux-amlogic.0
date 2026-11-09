Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CFB606A31C
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CfWd4foA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tk78qJ90
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wmnVTUdc9K+0rh0ALH22hjlBujUXgDcahduUDp87OQE=; b=CfWd4foANwgwSG5bflIuqFYxkb
	Za44aPEJOg1wK96cPZ9nsH8P7dlFNKcpCckX1EekFnvSuULOY/WIvfZeH3DHvdQ42Uvt4VofgkUqc
	4sBEkfF5buN7fw1SrjMnphGuTaZDNBZwmHJrtIQDVjg4wrKyjUrCTE20omil24pK/VAQ1go7XUE1E
	yyv0IbfRPje4B3TOn+T8QUyPFa3c9ZjSatLiAdu01Ah5I4Pj1gny+ZLDE5PBkWlOywwxib1bUMKoW
	Zo3vU+jCu5FwCjB5TfphFGI9FtlwtNxJGbcxbUTN/FfbKfOOcdpLLb93OfAa//Qw/fUnDKvatShY5
	Jsj4GYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKsG-000000005ho-2YOA;
	Mon, 09 Nov 2026 08:37:08 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKsC-000000005gE-0tky
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 08:37:06 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-49134c8509fso479913f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 00:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794213422; x=1794818222; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
        b=Tk78qJ90Pngz1wSyRQxR2XMVBJtrsJqlub74t3kJrPTVegOWpOOUjxY7srP5sQhp8x
         JGaSZQpx4Hf/k/a8TAg9JNfT5cgMkL7z0lhoJJmLs0ZsCP6VNpPSpwy80MefB//BQyXs
         7YgpOPaD5ICV06V7xBZ15G7KAlbRrIOcA6IkooooMr8VAURQxz5JptmMCWQTl14RinRp
         8bTsDtvFP0qNW3FbpjEdfxEABXPbu1r0xiphN3c/HvdvtWrID8HRAtlkLvMN8lSo5lv9
         YDXAssvK0rPgYdUFIuBe3qyjnFlUhViyyUJeDkHPVx6n0xuXD3xxETttVPufaVMMo9g7
         j0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213422; x=1794818222;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
        b=ZrDykHowWqRA1enQwnXTqZDVLQfbAhFT3sJeuqZVpTSVG4AyxGh0MBkUwawE1Ugfnd
         w2goaEdpcaIzNqpwNfCTCqYYqLz4KXKl4q57lPtmtuMiYWAzXFdiAud/u+lwpIEwlXmo
         uc/SFL6FVbPz2Ds1CpneMyeGWcW67+mHIA/n2qtAR9TCZ8dhIYnTOuSavqVUsg0kER3t
         XEWk5MDcNwIBJgYH/qI4sfWwpynr4/zvgfF1Qz7MYXBCQZzN06pa/qHsUxqR3hV15ENw
         Ai7zAAfzVdoF+RibaY84dHlMoxBpKy/itdfVz0Nv9R/OqXtkVSnwPViLAvSM4UQBNCFi
         mdGA==
X-Forwarded-Encrypted: i=1; AL+hErEtyboj0c06ymhrwvQ5wIMsg17AIN5HrgFeRD38nkgmy+uVrI5iirsNx1wGz407+GiS6iWRsgLgJbkZKVG8@lists.infradead.org
X-Gm-Message-State: APuU4Z9sT3kHZppE5Eg6qkKo4tQ9Vubazy9OjdNKKwMxxgCooSXOpZau
	Gfl/TBrDiyI5+4GaXAtAmrpK700txummpQuPzD0IRMypP56V9P0XZK4D/bb++PvaAJU=
X-Gm-Gg: AYBFou0Jg/hWI/1Owf+EQqXdEYFAIIcWK59RJvuXMNOwKeTA6e8zBS5RbnH8Pl5lydt
	PcEQF36CSnLIIVBH1uLKprahuoQslaQw1tIUPiMoBEHNsfdMXYYm+vwAlC7MRti9IkPHYDC+zin
	IH0OVBFLP3FHf9dEQYBFu13b55lkLSpoqP7zwFUjhvDRqoqxOncRS37Np9iBc9UOCiVZz3FakPD
	hpNCFfrcjMvCHB8UBttDb2+uZq1w5CLSBXyy0lp0SFYPfSVJ1R2NBfPK3mg4mCQRLIE78UdVbyQ
	STviCPHJ8KeiFitI2OCeabX9JAMORIOyujG+x272OiPb8oCZCOhy8F/gjDRvtbGfjPVAw7oDZ5S
	Z9B1QeOGSu7S8veqrHjjgqOLNazKATBRRPQPnFC/Dbi8qFFzt6EltIy4DkA7AHm35DTblh0chBX
	caad+ofEoag0lMLoylzyESkB7odEuaXdSxYATop0qMnFvZR9Ug2LBqQfP96VAvdnVU85CbNpASQ
	vmeSBHFUvKjw/22oQ+bimKa9oWyH1xmQYdglYOWziPG0vVZb7hiTby7JwWlGmnI8/IbXXoP9pLX
	wdoDNCDBRa7S++KVH4xFmsnVgxggaOzGMSZ5xwMiM9OZDvqx
X-Received: by 2002:a05:6000:383:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49585bae5b9mr5896344f8f.49.1794213422144;
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm8320547f8f.7.2026.11.09.00.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>, Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan
 Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
In-Reply-To: <20261108-computer-backed-d98862794d18@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
Date: Mon, 09 Nov 2026 09:37:00 +0100
Message-ID: <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_003704_556817_C8280FB9 
X-CRM114-Status: GOOD (  18.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On dim. 08 nov. 2026 at 23:21, Conor Dooley <conor@kernel.org> wrote:

> On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
>> The S7 firmware exposes clocks through SCMI, including sources needed
>> by the other clock controllers.
>> 
>> Define their identifiers so devicetree can reference these
>> firmware-provided clocks.
>
> Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> vary here between versions of the firmware?
> They're also not a "made up" set of indexes, like traditional clocks
> are, they're real numbers that come from some document akin to
> interrupts that we do not have bindings for and no driver is likely to
> reference these definitions either right?

There is no such document available unfortunately. I'm not sure one
exist to be honest. Those IDs have been stable ... so far, but sure,
a FW change could change them.

The IDs are totally made up, in the very same way the other
amlogic clock driver IDs are. Providers and consumer just need a common
reference to desginate clocks, this is it.

>
> Is something like this not more suitable for being included as a header
> in the amlogic dts directory?

If you think it is more appropriate to have them there, it is fine
by me.

Carlo if you have to respin with this particular change on the DT side,
feel free to add

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

>
>> 
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>> 
>> diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
>> new file mode 100644
>> index 000000000000..10d7caa5d1e2
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2026 BayLibre, SAS.
>> + */
>> +
>> +#ifndef __AMLOGIC_S7_SCMI_CLKC_H
>> +#define __AMLOGIC_S7_SCMI_CLKC_H
>> +
>> +#define CLKID_DDR_PHY_OSC			0
>> +#define CLKID_USB1_PLL_OSC			1
>> +#define CLKID_TOP_PLL_OSC			2
>> +#define CLKID_HDMI_PLL_OSC			3
>> +#define CLKID_USB0_PHY_PLL_OSC			4
>> +#define CLKID_USB1_PHY_PLL_OSC			5
>> +#define CLKID_USB0_PLL_OSC			6
>> +#define CLKID_ETH_PLL_OSC			7
>> +#define CLKID_ADC_PLL_OSC			8
>> +#define CLKID_CPU_CLK				9
>> +#define CLKID_DSU_CLK				10
>> +#define CLKID_GP1_PLL				11
>> +#define CLKID_ACLKM				12
>> +#define CLKID_PWM_G				13
>> +#define CLKID_PWM_H				14
>> +#define CLKID_PWM_I				15
>> +#define CLKID_PWM_J				16
>> +
>> +#endif /* __AMLOGIC_S7_SCMI_CLKC_H */
>> 
>> -- 
>> 2.56.0
>> 

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
