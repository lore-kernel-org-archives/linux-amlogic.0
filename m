Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A821606A31D
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DL4R9MAX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bDk2IkNf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=65oT5WJylsQSujHAhLzwyCYFfIY/6tDQgUO6haXcADw=; b=DL4R9MAXPysoML+EcoSLf+zSsu
	rKwuc0T1jbiP3NNWB9YTEeQS6t613Z3OgcAIpWmJ3Yypdwd7qPnFS61Aa8ogcWCnPPjV7DfwfepJj
	JhbC2qw8UK8N5nmdM+WhtDcJJvdhBgrO+L3KAbLvU72GbrVq1LEFH5PVtL8p/M/wihKDnipeVnslC
	+mfTsLQ4kze81QYcJIGkf2OV+XZodVibeVTvBQjiEsQq32czE887kh/6ff8aSv51BmwLrWw0HNTlM
	Iy7qSVDJZ2Yh6t5GzFy6y9xozW6NLIu/9rMT+nMTsMPKIDdJ0Vs+ukH+3xEqsgEzzgWP7MGmTezq0
	lFYjrh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnaY-0000000Brfy-0V5T;
	Fri, 30 Oct 2026 14:28:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnaV-0000000BrfA-188x
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 14:28:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a210470b49so5688665e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2026 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793370488; x=1793975288; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
        b=bDk2IkNfjthJV87cyhG74IqMW64kJqFdICucWpvSu7HIvl5ETeVQn56ltvviPSIRgn
         TZRmnYd8XPZ/7XgHVJ/I0OxE9yQlfI0uaPi8DMXUB5utAo0ixaaMI1V1IjSOnki1wdKb
         qqeHM6hxv7HeKkdwzrO7lbnWz/qf1Micz9eUVVq1byql6uZC0aVuNNDziG05r84meyGh
         yc/6D/v1CvZZqLPm+GNmEEDTDRFg04ODPK6R2TFrwsw6ap531j1Q1OHRz89HqIRZWXAn
         Rl/96oiDvhK9WvAdHlZrgFEyEsVKAzEcnpP8vBaw5iCNS6gAOrfi3N0SdKeolWNiHS+4
         NYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370488; x=1793975288;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
        b=DlUVcjQvuHhn1B8Q/Cv8mlu5Z5IP+88ul083iy1Xx++MjGEljQRdRd64hCame+3lJi
         er50vndaJWf5sxO5GSv7E7Ftto0Vvun0FM3tiBirogEQEmjJsSznb1g0h2lsQB9Sveh3
         QwN1ApHZ+92rMQfwjobGXDEifyypukwqyLR3RatBTilp6WSrmYcir5vyT/5EVwR+9kyg
         2vYyhlW8ZmfeaID24xls6TGI/RRScVaSFdwWr3jXR9VwEgp35qja0fU9ZFxf7Y1G/6Kd
         qH30ex/wEqty07OiGTo30hiqWNXOVJuejSpHpME8c3D0CZsheSZgNPVzNUZPJcgpCJLb
         vsvA==
X-Forwarded-Encrypted: i=1; AKwUvBwfWYOQiC+cAGuufjIBZ9SwEGC8ZEyHiUXITWS1fpg0gxBF6cMnvwrWy+FkQ3f+yOxrT8syboOa5bxrH5Sx@lists.infradead.org
X-Gm-Message-State: AFq9FYJThl5S78yPQzuymAAuXzC6VzPgOfN8OzgoRLej5UC86wT7IKM6
	5iigTXjQIROyScghi66lBoIXa9Zf95zMJV6KLZdpjPfJiTORerxuyoksUkCblQbnE/c=
X-Gm-Gg: AYBFou0psFJ0NSs8RoeNxgGUQx4smQwXv0/njUbZTgt6tf+SSiAbaQdbxLpuuvXYs0R
	yz6ZhzvAUtZMN2EPhOs08yUkjY7z+3iTvjZL7FUXEMTcgNF2qCt91T82q4lg/5JVeVps2ZU2UC0
	AtM5ptcPgthG7cV6LYN0E4Lt3ey/CB0fcauFoUXTU80EB5jOTfF6hcJPdpItBFyGqBPoKgioIzI
	LQu3X2Rv2LzgB7z55mdB9DKBT1coW4V6kq7jizuqsZuKXyg24f4xvRClTR463mubs2GyjdvDVZZ
	tE9VYhD9+5GvpkTNi8PPNrsoxjc9pLr7LRNMg5X1hVymQUZ9CTPRymLeoFt7S/nUmuOpJyc2qUq
	TLZO4vicrYtvFWnxQvVkvj9MVJZUT/23o1fIsxeznWR4JU+a4cbnFFqESNbGovRSkYopjOgteCa
	dnJzerHbIeATecLanpvpaCTk3J7vsGgGORgUfew2IQog1RlMRreovAm8tH34j9AWEr6aYE1wY6L
	axStiV/jxZ8j1cqKTfK8pltCRYH+KY1WLOJ2C3ky4r3NB0EPPDpwCgEhkG4H9vo7ppVj/rFCvhK
	KMR/iN2csE9DLnpvtyu9HM565T7T8BRdYV1/JyYd5iD2r1r8v/p1oYg6312T7rIj7Owu6jZil0T
	I0Ja6xlzmMn/BEFIlgv4BEGd+dJpcfxL0dtwBL4AcH6UA7uR5dRyS1WITAly3LFqeZN0VT6U=
X-Received: by 2002:a05:600c:8b63:b0:4a1:f688:a5d5 with SMTP id 5b1f17b1804b1-4ac187a7655mr51642025e9.23.1793370488309;
        Fri, 30 Oct 2026 07:28:08 -0700 (PDT)
Received: from chomik.local (ory90.internetdsl.tpnet.pl. [46.170.50.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm53158235e9.4.2026.10.30.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:28:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for
 S4
From: =?utf-8?q?Wojciech_Biega=C5=84ski?= <wbieganski@baylibre.com>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Date: Fri, 30 Oct 2026 15:24:06 +0100
Message-Id: <179337024629.131241.9227206619077693683.b4-reply@b4>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_072811_324001_78F65261 
X-CRM114-Status: UNSURE (   5.69  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCkkgdGVzdGVkIHYxMiBzZXJpZXMgb24gQVEyMjIgYm9hcmQgd2l0aCB2Ny4yLXJjMS4gRmly
bXdhcmUgdmVyc2lvbjoKJ3YwLjQuZmYuSTBjODM0OTUuNzU0NDRiMycgYnVpbGQgJ1RodSBBcHIg
MTYgMTg6MTg6NTUgMjAyNicuCgpSQVcgTlYxMiBmcmFtZXMgYXQgdGhlIGRlY29kZXIgb3V0cHV0
IHdlcmUgdmlzdWFsbHkgT0sgYWNyb3NzIHR5cGljYWwKcmVzb2x1dGlvbnMgYW5kIEguMjY0IHBy
b2ZpbGVzIChtYWluLCBoaWdoLCBiYXNlbGluZSkgd2l0aCBhbmQgd2l0aG91dApCLWZyYW1lcyBp
biB0aGUgc3RyZWFtLCBhbHNvIHdpdGggSS1mcmFtZXMgb25seSBzdHJlYW1zLiBJIHVzZWQgR3N0
cmVhbWVyJ3MKKHZlci4gMS4yNikgJ3Y0bDJzbGgyNjRkZWMnIGVsZW1lbnQgb24gVHJpeGllIHdp
dGggYm90aCBtbWFwIGFuZCBETUEtYnVmcwpidWZmZXJpbmcgKG9uIHRoZSBjYXB0dXJlIHF1ZXVl
IG9ubHkpLiBJbnB1dCBiaXRzdHJlYW1zIHdoZXJlCkZGbXBlZy1nZW5lcmF0ZWQgKHRlc3RzcmMy
ICsgbGlieDI2NCkgb3IgcHVibGljbHkgYXZhaWxhYmxlIHRlc3QgdmlkZW9zLgoKRGVjb2RlciAo
YW5kIHRoZSBvdXRwdXQpIHJlbWFpbmVkIHN0YWJsZSB3aXRoIHNpbXVsYXRlZCAobm9uIGtleSkg
ZnJhbWUKZHJvcCBhdCBtYXggcmVzb2x1dGlvbiAoMTkyMHgxMDg4LCBub2lzZSBnZW5lcmF0ZWQg
YnkgRkZtcGVnJ3MgYml0c3RyZWFtCmZpbHRlcikuCgpUaGUgcGVyZm9ybWFuY2UgYXQgbWF4IHJl
c29sdXRpb24sIHRlc3RlZCB3aXRoICdmaWxlc3JjICEgcGFyc2ViaW4gIQp2NGwyc2xoMjY0ZGVj
ICEgZmFrZXZpZGVvc2luaycgcGlwZWxpbmUgd2FzIH44NSBmcHMgKGZpeGVkIG51bWJlciBvZgpv
dXRwdXR0ZWQgZnJhbWVzIGRpdmlkZWQgYnkgdGhlIHRvdGFsIGV4ZWN1dGlvbiB0aW1lKS4KClRl
c3RlZC1ieTogV29qY2llY2ggQmllZ2HFhHNraSA8d2JpZWdhbnNraUBiYXlsaWJyZS5jb20+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
