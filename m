Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F063606A327
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2026 22:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c/Dx72Wr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=T/jGuHPB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DwiqrUFp/s/sRKpsPNc25BsJImu0Ajk0JXCNv6o6KFU=; b=c/Dx72WrJRkBnUrTZF8zjhOROM
	dpkTnX+eFULn5Rq5kEQp8sKSYlPIVup4PJyZztD43rC/HObmFImQMidM5B5C8r+k6DU8r9NU4GPze
	ARFbDAdC3hgSDvhC6EiuP0lTMtE/jKUOFzzyLdvmGGSV82+xCnIWyfoyBqsXG4pQhEbqJOYlZNoXk
	llLLH6rAN6Lz0+bDCMJLVheB84RtXr/0fSUiwo2jcNbUEyKcmTTQAu1aGQo1XQO60NoOAvtUcP7sa
	9F2UoBrJeFEbei4o/3/2650Gd3zSra26Xu6kZtE9AJLSUsVQhG1vKJTqmI8HL+fSeVws+LqnBUUep
	8gjXAtYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeV6-0000000FBap-1UFr;
	Sun, 01 Nov 2026 22:58:08 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeV3-0000000FBZr-1n3m
	for linux-amlogic@lists.infradead.org;
	Sun, 01 Nov 2026 22:58:07 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-679334baa1fso2482083d50.2
        for <linux-amlogic@lists.infradead.org>; Sun, 01 Nov 2026 14:58:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793573884; cv=none;
        d=google.com; s=arc-20260327;
        b=E7kVHiD3W6UNlY5zCYesKR8qsDFm4riopB8kx/4gxgNu8W2jp46XsNKNAOs8e3wzlb
         8EU9AGaUyDo8LFWwPa53CMQTysrERfXNiU3e2Zs9UwYnzUHSfFSEy4yHHAiVAohU6iRu
         IgoplkEu8ve5/nfBDQ6vSJOEDmPX5ICmMh01FCNnVTvlKj3JFTqs/t9gKlNwZUMpUQBV
         JPhyDoVsxh1zSNZHzZqMof3z3VALP2ZhSzLdfjG2738DjKZTs4cWmbugY7AUuIj/JXEn
         hElVoAik75gTOYpwPLZUm+7T9bDQAiSv/h2Cns1C3ys/y8v1DYBGDm3UakbSVEFthOzQ
         LjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        fh=j1sF1vmD0SY7U6iFsM7p+ehEZYT8BvX/feMYykl67Gw=;
        b=ojVf2Sm/d7CRtAe70N280WZY1JiIQTOvEK81kH5LFJ0vgZkxlesSlWvx9iTPeYBK1D
         RKx2CSkMvoU21EsZnqdQlK/To0KFM7RJYHnESu8jB53Xm6SyLhKhIeT4eDwQvqGeeAIQ
         K2QaJxT6fp7ILq5Laq/5H4hl7C2P/6Elw9HjHPnq3ZI/H1OiO0leKHt86NEtchZjjdsG
         8rTarPlrVmpPIxBUOhBmPAYFUCU3PYYmFIDpqdmH3JwbQgHi1GgcvfOA5nbxpE3e3FuU
         7u4sr6gg7ouKrnKl0BYTaqr9NJo1oMO9TpGiq6xkqJiEc/vJHzSjf8mv9ASCSYJpHa9d
         21zw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793573884; x=1794178684; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        b=T/jGuHPBT3+Bb2ItL8sifH2Wj6wz/tIJv4fNcuT7jodygIY0Lbr2CRtD31GZjE+obo
         Pu+8SYf2hJXOgyLJ61VRSP/FOviF1dfMWdior8zCCEGYCsW9K1okwvwF61SyNyKL9C6r
         HQIgyxSH5NxOMCH6ob85SZCOkS0ATanKHS7mS6Y+oA6mvYEHvoAqNVxttF4wsvECh41V
         dCi+fcqI8W59t3WmYejEZsBnojjuaxlysLlpeuPNRKPPBPjyveTsF/n9sTTPxR8HzxR+
         PSUD7y253Np6lapNSuP9ZYqdSSMbcaayvxynvPkyQTIFqdmnl7aoJCxfRt7q2YW2Sw25
         CUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573884; x=1794178684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        b=RfmDPRHHVOf3vFZRUq5SOszftRRHW5cVmgx6Gjya03OqHfeXusnuCnVooscN5XZ4QK
         Ht/Uj8C6otksV/Q2am3TRr35pgaRUXw7fNK8Z1Bjk5vSGWzX90xrztwOnxANEuJq85GX
         3gPWx+gNL10J0nQnF5tSMoA4eRqkFTuGT7oVyLSzYSdUyqpHtGw4RHhfcTHJ2UtecsWB
         PkcdDHYEx6+kE2PnLRsvL1eKEKS705n4Y9GofHn2A2sa6Erv3eX3KqcB6y9amdRwcezK
         PCKRm/2XJUXIfCRtLx72qlAwg2OYx0OgGEU7RDu7BckIVh+DwXUY/c6vaTha4TgpYpSp
         8uEg==
X-Forwarded-Encrypted: i=1; AKwUvBySMUK1//Ai92QhORXFIK1Ncg6f0Z3Fa/T1J4XOI+GV1fPh+yLZ6i3AsOJ8pjwZ1vZ7t8BU5LG7HwipHN4V@lists.infradead.org
X-Gm-Message-State: APuU4Z/FD0BQ9ui1bsda/CGf36sbNtgFnmJjP4XqyMKZB1XpBTPwAxyz
	Nh7Soih3qvR5J48vL44EY/JPfHWFP/chWNcN2JNq1gHdLOcYZcrT17Wxnl2o1enk+K5WCuCPXNF
	rv2aHb4ejs94GVrhH5r0odgsD2kCfLQM=
X-Gm-Gg: AYBFou3VVSmdpQuMbi0zFRE1Bqo6axcYUCsJUUBUBhBCMOj69+lXGPhyOFv4XPQT181
	z6QWldv62BN1W/+sIXKjdusYV8ORxW8v7pXRpontz4QiZBNEmF+2JvzSXpJNF0zFgC2maBDJRRA
	SyiWvQF7gNxODGw6CIml+Sr523qUNyJvRClATSH9hgf+yQoP9HQMfEdCemuPqsfafqPkUdd81Ti
	uDZ1SKXSc8+hOUSUTPCdESDFK9MSmRK0vub1xaf79JSL0PMcURWaffLn3F98AOPFMVGj/+t3UM1
	oEPsS8iDsDu8rE2+PZazXegmrqhZu0ANmxEt2tIqbh8983ZADbHvvwRZqIOJe+fgtgtjPsW2TVv
	38n3lQEuM3Tptcgq/CvHtnU4ieQNXx/8vRP8IuAtDjSkqz3h+mm/ORk9kMnmb0zHjM4Mb4w==
X-Received: by 2002:a05:690e:4507:20b0:679:5bea:d3f5 with SMTP id
 956f58d0204a3-67ba4f7cd36mr2946413d50.50.1793573884100; Sun, 01 Nov 2026
 14:58:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-5-tanure@linux.com>
In-Reply-To: <20261022200640.3101932-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Nov 2026 23:57:53 +0100
X-Gm-Features: AclHuK9XeeIDEqdtINHt3p0JMcC8yqSM3_Rvc2uE8IOAzFd_ujX08owtUzvHpsU
Message-ID: <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_145805_491744_0F5C84BF 
X-CRM114-Status: UNSURE (   8.18  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgMTA6MDbigK9QTSBMdWNhcyBUYW51cmUgPHRhbnVyZUBs
aW51eC5jb20+IHdyb3RlOgpbLi4uXQo+ICsgICAgICAgaWYgKCFkd21hYy0+ZGF0YS0+aW5pdF9k
ZWxheXMpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGR3bWFjLT5kZXYs
IC1FSU5WQUwsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtaXNzaW5n
IGluaXRfZGVsYXlzIGNhbGxiYWNrXG4iKTsKSSdkIHJhdGhlciBsZXQgdGhpcyBjcmFzaCBoYXJk
IHRvIG1ha2UgaXQgb2J2aW91cyB0byBzb21lb25lIGFkZGluZyBhCm5ldyBTb0MgdGhhdCB0aGV5
IGZvcmdvdCBzb21ldGhpbmcuCgpPdGhlciB0aGFuIHRoYXQgdGhpcyBsb29rcyBnb29kLgpJdCB3
b3VsZCBiZSBncmVhdCBpZiB0aGUgbmV0ZGV2IG1haW50YWluZXJzIGNvdWxkIGNvbW1lbnQgb24g
d2hldGhlcgp0aGlzIG5vdyBtYXRjaGVzIHRoZSBhcHByb2FjaCB0aGV5IGhhZCBpbiBtaW5kLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
