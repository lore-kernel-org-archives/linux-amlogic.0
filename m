Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFA4606A330
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ihPMvH0T;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UC1d7YND
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9SEChd7+dl0b6s592ASeT1DkyoUnyOijk6lUDrwFABo=; b=ihPMvH0TsdcoMcCwb0Kgixnhks
	9kb6JMJSE95qKmoTHZwBcm+vJPYoG8QedmRUV2lo6XKb7GCiqMtrLwOGs8OuxQwv3RsMOT5lllDtj
	ggfWrbrCSzXTKiNZbEl/DEi5B/bKipuQ9JRmhl3mVHa3bDAFD9YuqyxbuJo8v+EXgYiGLJ/vCLPAW
	p0ppRVuNqQ3iBNDDUtr9iJ6E0g8lA0ZT+/mP9vZVBau6VtWas5xJx+ZzqWAC7HOsq9oq2K4uHxRzF
	hiGCwJp3pY5Dbd41Krw72FfqieiwQoKNqmIN8KcdiOt+gRLdVhi5fxBzBT5Svm+aGAH2TcH+yha/I
	tPZKguvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPi4-0000000DXLc-3Zvz;
	Fri, 06 Nov 2026 19:34:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPi0-0000000DXKS-22sP
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 19:34:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so10602285e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793993682; x=1794598482; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
        b=UC1d7YNDgoVxJdUHy2aH4qIWPDmvb3yvmWirR4NRtPc7L1ZBw4LtZH+UTc2HGVT0Qi
         pOdJOITfmHjR5r0rm3TrUt+kLjnxP/SnWIMqiM6/NYMICcZYzOCdDG2xohNciYJCXdSD
         2SHRTn1BPt6BIh2mmOQS/81rGKAVZ9XdsYN6GPznyMsgO9rtDkwyiIteKbi5xesTJaUC
         U3m5j00pcaSTKbwzYqpGDY9uBfKke2DnF02Ogw49zuDwRSEhxztFFlyDcZaao2NLLHe9
         4PkC6nugvLQslektUsSBAWclwKXHf+sXeZCNY1CKtinAI+ycBTxrbF7FYybq5YaqNR5/
         BSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993682; x=1794598482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
        b=Bh/6YWrkrlNy9xF1lYlwpHkhS0S09SWFkiqCelZbrTtbFIxdowRWQTimLVLFdjcWT2
         qL/xCKkPsKOBJrle6QMVjbKHmfOl4Z23GD/iaPSMmXusxjY7Db55Z0PF98XD85EbooQo
         HCAGiShj8vb6ZzYUajy7fMlDc44MZeiKJfr3bjiPjxmeukTM19MHY1Y12+ZBTckeNbVm
         m5d/535n5CXHW99Y/A9dQHtm6p5VzQN6EbgBUWErykn4fvxE2ZmQErbnN7DO5RfV2AY5
         fpMN0LphRlgX30eThFEcfK5rG4dtl9buJs2gfU4uXaVUUDeus2/jI8GWwL2NeU+gnov8
         YTZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQo5WJuyW04g+auk/fn31VIE+Q2B/sslcRiVFk5AWSwGkqORygQL8nZFlo36SojB4/lQOT+cjfDGGltrfB@lists.infradead.org
X-Gm-Message-State: APuU4Z/GCR3fe7D/rUAdIDv2S9VrSnVG0hQgXkylCXPP0qqpLzSmqoY7
	B6el3VizC1uIWyEdgDd8HEkLhKJMphv5rMJl1q8XkjUYxVtJ28iCMOsovBwOz+drCLE=
X-Gm-Gg: AYBFou31E4G82tNSojaeLoBWIDD8cKoGnTdW9EH0/wb9KfbGx9Psj9E0DSw1lm2co0c
	S+5e3sR7+LN7fotHMduu/ifjNIW2Z3D5s2aZyMvdqctgT3K9asogdAskoMWXaRc2/TEYyjbz2Ni
	6q2KfWJd0Cn9GAos3xVbQYDX7eqs4I6g2Lw2xIB4fz91QUUc1CuqaoyygJq5vzDLRTjrbNNbQZc
	OeW8hq+/DAeWbL+DM297qPxwYRnPYF7Cdgzxd29mXNlfs4Bu51x7JF0A6xoB6VdFXeY8633cYu8
	KoYEQrM55SHUtHnKa91cR47VbEHzeufdpoWBzXRZAmVxRomrCGRF+xlWCYZu1J3Cy6Y3FNABN/u
	ocuDpP1aoYRR+Pa1n+5hvbuv9RrxKRakywTNjN1mLikGi/L5D8C+twgyrl/m/AKTIDgSxPL3CtJ
	DmagTSk7PX7n2WP+lMNjoyupFKMPeR4SlOozh0ELIU6QNPzgmG/svsQsSCM5zfmnC0KGQ/EkRtP
	g/aLhEf2vNc3nK875ChBXTEokCqMfO4keXXWVY3jlP8b1UFHFZN1re/TchoILEHtzJus8LvSLGQ
	P5WI8tk+GJ3QiUuCxbiXvlAA2d3zCn9HRE3ZUY6t2tlVtBZm87Vc0eJIVbGH2W7bHU8T9P6LzQu
	H7t4pBO154rWqJ166/etWqbyl000CWGXZUQ==
X-Received: by 2002:a05:600c:3e0e:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4b6dfba9199mr64477945e9.23.1793993682189;
        Fri, 06 Nov 2026 11:34:42 -0800 (PST)
Received: from macbook (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm3329295e9.11.2026.11.06.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:34:41 -0800 (PST)
Date: Fri, 6 Nov 2026 20:34:37 +0100
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
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <au4p0xYEFkgEU6T4@macbook>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106-unwilling-preoccupy-156dbb310448@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_113445_012079_9932F1F0 
X-CRM114-Status: GOOD (  12.28  )
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

On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:

> > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        clock-controller@0 {
> > +            compatible = "amlogic,s7-peripherals-clkc";
> > +            reg = <0x0 0x0 0x0 0x49c>;
> 
> What's with the weird numbers in this example?
> 
> Examples don't have to be real, but when it looks like this the
> immediate thought is that the modelling of the device might be
> incorrec.t

The numbers are actually real, but the example simply lost their context
because I copied the node from the S7 dtsi (not yet submitted), where
the controller sits under the APB bus node (bus@fe000000) and the bus
ranges make the addresses relative to it.

		apb: bus@fe000000 {
			compatible = "simple-bus";
			reg = <0x0 0xfe000000 0x0 0x480000>;
			#address-cells = <2>;
			#size-cells = <2>;
			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

			clkc_periphs: clock-controller@0 {
				compatible = "amlogic,s7-peripherals-clkc";
				reg = <0x0 0x0 0x0 0x49c>;
				#clock-cells = <1>;
				...

In V2 I'll use an absolute address for the sake of clarity (PLL has the
same issue).

Thanks,

--
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
