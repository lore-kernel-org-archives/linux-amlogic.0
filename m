Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1926E606A32A
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eIa8C8C7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QIFrsHgo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sZv+NfN0boVz3vYlVTB2BIrhcSZjMeyQSk1Fti9RQlc=; b=eIa8C8C7Idmcq0L8EpmoRH1o6N
	VKK6l9PoLGOkdhpKk8uk1Ewd9LwlBfEEdPb10tXKf1kfTAAcGlKd2N54jxMM1qRQdBlxfPj5hJ3EN
	LPxjutxyRWBvlX5RpXMF9S81OuhyjMofoKQr9CJti4BAxibb7nqytWxkttKyWGMli0RNJqnZfgDMl
	3fW9Yj9kAEHi95TcXHU7wm4hL8XDoBfkuoZejSoKupiUnfp9lod6kYeZaJJAscMld9Nf+cPpkwc+e
	Dvf1TvDW0NQpriroMupFQ/CfVFf04j3r0pCbMVK8YftwJq52i1k9qz5DBe6g4B2Sc9GxEK+eArt8O
	EsI3XKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkpC-0000000A2ow-36ds;
	Wed, 18 Nov 2026 18:56:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkp8-0000000A2nf-3dnu
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 18:56:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so933805f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2026 10:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795028160; x=1795632960; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
        b=QIFrsHgo/01ab7z8W3FFRAZ9WfBi4zKmpy7VIOxn9hLVU5TGqYk6/DmTv3U3mTBZs4
         YfFQ1HFkKd0TqKpYM53jRNBZHngeYR8kUzhUQ/GEgJ1jP6a2GczuB59AQ66/lTDctTaR
         J3e7s238J6zod0jQa474aYisTIK5DCX+a1kZE+FVWHQ2oLBZvqb3ijHrmlwWm2NSPLjl
         DJ8b+yHTLLox5OCSRYO8wTbzpAAsiRAPYtE0zeTcx55y5pgZtoh35WsNW6h5eHsHik+F
         jWOWjff8zmtRFeEyfcGCkMr3FrroTs/C7vY357MK7fQ8zrx7oNTSw53cvM7l4VpN2MhC
         fQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028160; x=1795632960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
        b=KJu62wwNRfdr7m9sQ1tDphaM1oy/z+0PFMevUjldCL617TrLnto/eLQ5GAzRzAto6P
         dE00NhwZtMuwShhoYOlyt2t4sTx/VN5xshAConCuthi+F35ZcTmlaOXHmR8PIFVIvHuJ
         Gj7VtATqlAzqgZGuuLJilghG82SqbTDYkcoVO6PuJ/nOkGXpzekhdoeHrd3hVa/UAlFY
         BzX4kxQPJsKS8bb/SSb3kc6JtpbG8EF5UILcFWuMMtzRCTSU4PU41plOhgaMS/6qV37H
         k9taSEo6Te8ev/QAN5SH3l3n0VQitdxjTuoiJpUOGed0+vsPTFIUEX3tVW7RIszO4fVp
         icVA==
X-Forwarded-Encrypted: i=1; AL+hErGTiktGEHbGmExpzdfSkNK3l6+v6Gw9jNe/inZRIy0ZnX9ULaSnRYXgPaOVG9zA5NSoPn5TzeofR02f1JgC@lists.infradead.org
X-Gm-Message-State: APuU4Z/9ItbHgIBo6YApzNMNPlh0d/13dLic4+6ox6+wkOAEZd7fucQu
	pdEUKQRFuQLwW2MIfi/9vcjJVjv2ak/Ae8L21f9wlUYb+E7R3C6M6QnO+Rgvou9KtyY=
X-Gm-Gg: AZFdTZfmEXWSKrRnmn3q4clQvm0IChnGGWOE7sSZg1+S55ATA6pdrlE3pbnicR3+Pix
	vnV+ZkUTpCvTFueYBmGlAwYxurw6FY8pVmtf4/Putq5Se09gmg6OCXR51sQRaHG+JUQA6sRI1NT
	Ed3u6QCIa8JAiOYmrMc/EM8GuoN+c/8HLBDoOYX7M4vt18tnoUViWzawLLZan5rymzbtLooKXYz
	ws1s3PqCbbV1UhGJV8tgXkcM4gBZ450Jx7M0WFkOFq7KLBjnvaWLyGgtdJPD6Nx4Fwdzn7VpqFn
	kH1kPT+36+uUJpKHoxQyel7USpzSq7gCjFXC7l2tmkeiYlzAY7V7aOEbLqqIleWMCHVG3Pvt9DP
	08b+BpFzEpcNLMsaPz+10o+dMLzXRLT+VRxnRJ2QwnKhVkIl4bbUDxEo5Jx8PPkAsWih7q3Kjl1
	ZGUqurO/xhCQNGpL5jE09BtWLVH9SNVfE6Dk+g9FQgW3vbR06p6ScLINgAw442FTW6NVOOIaDwt
	8HwcuwsmDmjiYCj/RQhhHldE7XRB5I+XYAF+nnT9FZZLCTo/pDQQI8dfK6fvAe4aZ2CJTBfSwZj
	sQDYuZClPCmCW9T7N3HaVP04e/3lqenTh8Z8bQuENQciPlOerwYPuaDaISeG18Hb3VToLw2GF4P
	06WX3sLz/H+RLJ4Uxt/ZIfTgiMs47LIM3gFRrqqzxfa5+Ww==
X-Received: by 2002:a05:6000:4914:b0:491:8462:20cc with SMTP id ffacd0b85a97d-4a63ac6b48emr8023295f8f.37.1795028160455;
        Wed, 18 Nov 2026 10:56:00 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm6144436f8f.37.2026.11.18.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:56:00 -0800 (PST)
Date: Wed, 18 Nov 2026 19:55:58 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] clk: amlogic: Add S7 peripherals clock controller
 driver
Message-ID: <av3zyakd8-7QfIk3@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-7-7d501d62621f@baylibre.com>
 <179499607256.413320.17594110166305844754.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <179499607256.413320.17594110166305844754.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_105602_917814_0E559715 
X-CRM114-Status: GOOD (  13.71  )
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

On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > The S7 peripheral clock tree is derived from S4, but its clock sources
> > and routing differ.
> > 
> > Add support for the S7 controller so peripheral drivers can obtain
> > and manage their clocks through the common clock framework.

[...]
> > +static const struct clk_parent_data s7_sys_pclk_parents = { .hw = &s7_sys_clk.hw };
> > +
> > +#define S7_SYS_PCLK(_name, _reg, _bit, _flags) \
> > +	MESON_PCLK(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, _flags)
> > +
> > +#define S7_SYS_PCLK_RO(_name, _reg, _bit) \
> > +	MESON_PCLK_RO(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, 0)
> > +
> > +/* Named ddr in S4 and in older datasheets: the Amlogic bus to AXI bridge clock */
> 
> ... is a driver claiming it ? If not are you OK with it getting disabled ?

Not yet. Amlogic told me it gates the AXI data path of Ethernet, audio
and the AUCPU, so those drivers will have to claim it when they get
enabled on S7 (none of them is in the S7 DT yet).

> Did you test with or without clk_ignore_unused ?

And yes, I tested both ways: without clk_ignore_unused it's disabled at
late boot and the board keeps working.

Cheers,

--
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
