Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA175606A31C
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 20:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xtXyW/m1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YXm6ceWA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7tN9sks9FbdczSwyzlMC5f8PyZfoMuY3WFWw8wo/pM4=; b=xtXyW/m1Sf84N2lSqPozWkJ2DQ
	R5zJMmE1tIXUXMcSFqLSCX3Bc7oIlPTzQYSI46O4/0I18Luc9DwObU1FWv0NOjS1pz4QesM1qVIdz
	Q/H9I/UrMYxEi+7+C4G/On1ls6DlYaKHHCojR5cuKIya7e9zSLZfkvtb1LyecsFFlDUYTfsBYo3VN
	eM2e/ZQ2WxFWOo8IlM8yKPxGkJGxsvXoWjTjtsL3PH/cbGHJ9tzeJtP2D8buWw/s5YrSSJ08ad4NX
	Op4CTX/bAoohkwge9GdOCIrAn+kB4zQJEGWYb3gkVG4jBC9Jzq+9fKzTr36+wShbRWQQ+JVwFbJ3m
	9NPbobLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWSg-00000001iJj-2YoS;
	Mon, 09 Nov 2026 20:59:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWSc-00000001iHX-3IQk
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 20:59:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so13672065e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 12:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794257964; x=1794862764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
        b=YXm6ceWAvdp6Et9vLxo/fOhN4dq0QV5BBWaNwMMULk9KG/r7sPXXDQH07PZ3mQCsOM
         rsW+t9AHQyBy/HU3dKQTe1XU5Hjbtly/LHwMW48B9h+csATcwdhOq84jkja7b1sF9wzh
         rtzbt8khcJLVDo7wvH68N6h8uHcTPP7c6FyahY63pDft/kEOvU4Qw/Q1jzzfAaKDWI92
         rcR5T+6NuHJNrx1K6ejql2vU/JQMDBpqD4bzyf2ukXOUo57jzZQr2LiSafYq4gdr8r2d
         WHBUbvrnW0f5mq83LXtJ75N638yres942cdSjWlL20cEUY84Ss+PfS3GbpEr9ymUcjnV
         A81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257964; x=1794862764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
        b=ZEJaO6DWJDHs7WAiUXKWY3pTNrWpMq84hwVsh8EFtte8QEh2DMdZIrtb7g4lUdgAVu
         5ONj/QOPUsAdPT3ncC5vKn4Zmq7Fqv2mQd6v03/6hIkgz6k1daCc6WiPU1R2wgXLesAu
         ykuZ59J70FlNKj5LyFoJYF74y9hNpib0kIi72X104LrV4SjrrE9OHRDEM0hrxbusEw1L
         UhKClzte8/d3v2pg1Jr/8GnxQJ6N+Uyn7sciE3h1FXh9wscY+SYjYEr8NngR7tBHHFOp
         PB8UrTjwZh4hK8PLKLqbDBRbXwNZj28dQPxaDwjOy0DMiKr3He/TBRJKmxr6fLHmcURK
         0m+A==
X-Forwarded-Encrypted: i=1; AL+hErGjIECG0nsrCF0eyhaaFgo6MxdQKFOf23++Y3VAyCoe/g3z2io3EEurirs4EVrA2OYpt0/3SB2sPNYbCJMZ@lists.infradead.org
X-Gm-Message-State: APuU4Z84ODsZXNPLsacbsQRuT4pFYfnqhjPKudzjLDDLNaL9qMX8N1XP
	4jcLROf2hHbGtStpfgpej0Dgxctwn6hORMBGxqjjP5ssMZZSY/irAY4RNdjEpiLSprw=
X-Gm-Gg: AYBFou2ZkRn3M1hllx1OzOHbiRs8ZjGh4rqSfxy5swhTFeKcvrvWvDLRSY8p/wD9PGz
	rkvu5xND5TkIIgoWunyAl1TbkBD2cdoPDBKNvaUbjia3GlY9JmavuCcwYcxeaYbEf9A6VkmSRiN
	b5KLjPs9nHCCUU/yChsJT5ivcVN8t39I2xO9CzMtsqdLbxzfUVlE8WbR7v1osfu7OXs/qjH22tI
	HkNPq6DuluDKRq25AH9z8/ro2IdQcWFye7hYoP6qPP7YEK+9KYaD5ti+3u0XapIORRjINB72kwF
	2KvCScne/+lLXvVx5ZhI2/nXp/y18X+cW2ilK4O4nbbZvVCDTCbCTXbTwUQ0U1cg0i4KND13aXt
	8b2OPEXWZdIh5FKARf13RGSNiGMBuaj1lGWOKjY8dSBHYABi6UdW2gPKWQiLOHIIYIL2CwRng43
	VkL2sMkZwE7pjdv/wVo1B9R8F1viH1jIfoFA3CC12iWCqN572MXZOKRGW/FCCeUPO8wua3GHjwI
	xwBFpqn3fet9PNcZ2R5bq0YKPq9FxuBkzMxzjlHiZXLotlATy0CCBJIDvuMrWJWO/CMTbTgZPbV
	UOcjF4q86jFV7S1YplxZiOkif/JOnXmEkG1bJQNLlrbWx7zkrqvmMItTTmPTTRFcYr0Bw/NNsVt
	ybNUMSIJ65kjjZdvfuRzv+Q61XZn2w3usRZAFy+bMXKMl0g==
X-Received: by 2002:a05:600c:3d96:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ba02347dc6mr6849605e9.17.1794257964075;
        Mon, 09 Nov 2026 12:59:24 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c99bsm1081150f8f.7.2026.11.09.12.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:59:23 -0800 (PST)
Date: Mon, 9 Nov 2026 21:59:22 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <avIv2GfXHuOPWJzC@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
 <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
 <20261109-stature-splicing-a146b4cfaad4@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261109-stature-splicing-a146b4cfaad4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_125927_532421_064374AB 
X-CRM114-Status: GOOD (  11.58  )
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

On Mon, Nov 09, 2026 at 20:00:56 +0100, Conor Dooley wrote:

> The "document" in this case is the source code of the firmware then.
> The info might not be printed in the TRM, but it is determined by
> something, Carlo had to get the numbers from somewhere?

Yes, I got the IDs by enumerating the clocks exposed by the running
S7 firmware, logging their IDs and names through the Linux SCMI clock
driver (using a vendor provided firmware and kernel of course).

And yes, the DT cell is the firmware's SCMI ID, passed through
without translation. Renumbering these definitions would break that
correspondence indeed.

Cheers,

--
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
