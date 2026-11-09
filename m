Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2D660735C8
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AfTkmIgm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=N3epthB4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CEiaRZfdXavuEr8c5JZoUeCqricc+XcZfIAJB1y28so=; b=AfTkmIgmwLIQV0PtDCQk937z/S
	Y/EjKpMk3ptp8mdjkWAdUEHSxAyn7NBr1Kch7bviRkZeQeI54K2KVYWZSLwz/UMIMfRCI4sLQI43B
	g+bHiRkqRgbxezAKbzdv3moGo59uF5TA6pLV/RSPk7AhaMBfrJmyRq9uWGpw5sJ392M3ti6yPyHSm
	1l1f+mL8s1HEmP8BIufOWGEGY0YH5aI4O6+0EWVne5xVzulMvofAfdS+S7i4wnVzCh6r8+Uih3fNC
	9CdIT1qXaAq7zurSxjpihlGA5WDytH6aAqhwA4NIF8GL5yN8gWg7u4X7cln3RHVvs7g9n0/NDyC2D
	2h1bVZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL4r-0000000088k-249d;
	Mon, 09 Nov 2026 08:50:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL4i-000000007u2-3ejG
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 08:50:03 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-49134c8509fso490811f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 00:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794214198; x=1794818998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
        b=N3epthB4vcAG2wGnNyNEQyo05Xhc4bcNm+WH2ZXEmmSPr43TTwCzowbKG8VGpR2xEu
         4dezzfzIayNcFokrfWbHpSB+L6rsCIM7ATKhTw6/cipZATcNh0YNonqeKCEg4nM5C7Go
         JZ0+K8jlhqXs8ylK0OG1/xuTPaWI1PE37aktIPR3oCUMfVxeFd6QDBCLu5T6PiPtmncK
         Fiti9Ks4OookxoFQxnYjVGAqtnSFOzXqADM2LfepO1F2XwbF/AOok+gpofqGK4kIE5Dy
         zUHmPCW32X7m7lzDEf9FNDqdNJN7viKvPyKBu8CkoV5DD+9m1ekOwmtJHJHksAOvDBwN
         9UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214198; x=1794818998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
        b=muFIVFei5be7CyOMTFh+xSIfa04ykf7J6uWFcIlhBCQdws5bQqHjTDaYTtFD3IFvJG
         Nb/rsO062iTrKLyO2Npys278pwSsBiN08LSX2Oyji9u/cnSLouuvd3ze0tgiD73hrOLL
         l/5/nxVS80ZGF43msoaFSgZ2eAoKylAqKVw9Rp4loT5vPJpUn26gbrUVLEhQjrliJdhH
         XsTxybHEfpW0MdexyD2b8P9LK9N36X9ZAWvc9dhfFrL4bzzSqx7msf4v9BNXwtjqbobX
         ueGXX2xplwo071YtOcvR2BHsA5/U8w4leLKEbVjrNXmNOMwQ5++NDd52P7fP7qyo/ta/
         3rKA==
X-Forwarded-Encrypted: i=1; AL+hErH9zcIL0/GO5ht8e2M1GtYrn3/Y9J75+2tsKAEr2wz/cGIngvBHFQmvG4iW8A8C0TvhS/aPqHBFwVirBEgo@lists.infradead.org
X-Gm-Message-State: APuU4Z/u1PnUv6oBwa9jxm4kxRfwpeUqzsOxb7l+aY9mJS34z/9A74o9
	ckCXZdAiXGAEkAC93f8JN+z7/FxmAD+lYasur12dBJudTQKfUnKos5Wj+EtoQ0LXGL0=
X-Gm-Gg: AYBFou3V9695EqpAdQ9F3LG+2vB7xTVH0v0sQ6aK1eWhR4WGEDvnOkzwrOXne7YYbmt
	9M0sL4cLjUDw5P60uMkzpNl0MAtcmp0jObsTp4dmPBSbwYGBSsThkAgrbFflRagkbo+JX5Loyqa
	H9rQwkF0Oyc/qCPlMMM9Je9zS0l031LM4HpVJI+vHauihZ1Q+f2KFZdtb8hWvI8dWdCcPvsNq4S
	SsM4UbfcbeoJ40BJ3X/8SzX/D5b2txdYl1x44lUorYLP+NeGD8VkAKH+iZ7mHlHm1K4hgslJmh8
	7iPe7qQ6MrDX8TVw3nEpXAybycAfO3uIkoObhPWUxL27hOy934NO/LWBqgSXb5SWu1AA2RTv9Im
	15gc6fK4m2tr2Ac6JL7PPG13hy6U0THc7nDpYZRJkXx8biNVtQpORmLVjlXxd6lsuXtKda8CP6p
	N3KfoSbvJH/bfB5zyaMhDkPBhbNyG3Is6o4w04lzbR2RO5vFVT9uIRhWURgV/Np84UVsWXPNtyi
	EeMnwci2PXb1t1565zEYWf/m5XjxMWgheP5sr+dCHjMX8DbHaSRttsceR3No79QNewT4GGXsrVa
	lRHrIOKd9dzRERjbz8Ck3x2PoSAf7rOGMana0+k95NCdbYAaakeEUUGBS6sGBreYykvhLq2fwc+
	Wtt4ySvYRStiRa3aD5jDNpV9YwuXc3yiS0IjzvgKBdovPVw==
X-Received: by 2002:a05:6000:248a:b0:48c:4442:54e with SMTP id ffacd0b85a97d-49584b5afe0mr6225635f8f.30.1794214198288;
        Mon, 09 Nov 2026 00:49:58 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597090444sm9069465f8f.31.2026.11.09.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:49:57 -0800 (PST)
Date: Mon, 9 Nov 2026 09:49:56 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <avGIMja1yTAkG2X8@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261108-computer-backed-d98862794d18@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_005000_959629_B9372B49 
X-CRM114-Status: GOOD (  14.76  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 08, 2026 at 23:21:08 +0100, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
> > The S7 firmware exposes clocks through SCMI, including sources needed
> > by the other clock controllers.
> > 
> > Define their identifiers so devicetree can reference these
> > firmware-provided clocks.
> 
> Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> vary here between versions of the firmware?
> They're also not a "made up" set of indexes, like traditional clocks
> are, they're real numbers that come from some document akin to
> interrupts that we do not have bindings for and no driver is likely to
> reference these definitions either right?
> 
> Is something like this not more suitable for being included as a header
> in the amlogic dts directory?

Right, I'm not strogly opinonated on this, I followed the existing
Amlogic SCMI headers, but I agree the dts directory is a better fit.

In v2 I'll drop this patch and add the header to
arch/arm64/boot/dts/amlogic/ with the DT series instead. The examples
of the two bindings you just acked will no longer include it though.

Thanks,

--
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
