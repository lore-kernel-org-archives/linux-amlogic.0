Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12E9EB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 20:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2ntHEFVdScb38FLY1UCg1j0iVPpNyzs947B24cMzqM=; b=3W/8z+md5j2iCH
	WbuWKBgLSiRWbg32CTzjROrb4D6+Hi+jNFdsKOdLc5+9yuwuUnTGyuAMciaAh5uBi7eoVaoTljLA8
	ACetjOVigb7+nAEmi07atWvsTExlvZ+1uIVpM9GbMktuVR6yWJimq4uIDDzMLmA0cbTyaVH9ck9Mb
	4v9i+oMWhoE0QM0F7nvKvpZfaCqQANPxY/r9bYqeJUh79kGljIlq7Ll/WNiCN2ZUUu0nxabza+jrT
	nOaI/3AAanb8FOE+gV7HpGGDj2D597sNPYUFNmi8wLAIQCgkd/1f/s/VAiYvurBZIi663xI5kGWeA
	21/cf4VdP+uO9yYbpWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEc9g-00Ggvu-0x;
	Wed, 28 Jun 2023 20:52:48 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEc9d-00Gguo-0U;
	Wed, 28 Jun 2023 20:52:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51d9a925e9aso56974a12.0;
        Wed, 28 Jun 2023 13:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687985562; x=1690577562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uwwnkhmaH+XqdTCHqXY7NXYfBiKXd9zzUR8VdsVxl4=;
        b=CBIk9WYo357aJEjuBNcKbzs9NSNFY9HCkN0OeyYBwfG+CkqEPc+0Aglm5vBtUXi1ob
         Y/ig0iJVlGBG8+qg3JuoafZbmSxktJvP+o4Eg9++Tsz1jvRIYrEui1wMG3roJRdz9fDB
         +EKYLq7nExU7APi7TNRyz/s07WdAYFfQcUKaNebuxq3Dm4zjTiy2Lno5Uh9YGwv7Bv9W
         YgwdKwzkkNGayWVHCQnrXwiP5GZpID+LWqvRE74oCnZMJnNw2lNtNn/bHEs/LXqf8sg3
         uN4Ly1ePIJDPoPARVUEj9oC9vH+cDHpobb7NpdA+8scsM3HmrlaNaH4f/EBUgYAhTXZI
         L0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687985562; x=1690577562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uwwnkhmaH+XqdTCHqXY7NXYfBiKXd9zzUR8VdsVxl4=;
        b=lsQ18RqpfqfLyJBUvvO9t2fdZcJnSzVj9/2yucy3LAXVdkTlMvMjosA1hjLTEUVWjy
         MyuQ31XjV15J5FbmJw1WergI+FzOTOE8kb/tCneAGVBil/vAFzjgkS7BE/wyHaFsE2zx
         fTRufU724Y23OGUbh2uj88SjNTmrq8pw9SOG5ql4VFfv7lSQQIMiCmsH0NJ0HS9Q3X8X
         zIMvNhW6qpzTqTfLFhKVVMr1KEMCu0esdmq2JFmS2Tx4Cle9Xx4vagTfpy9Z0LREr5ZE
         pSF2torRbf2fOYpJao/Y/j5z8IHQa0SNH0dgqMdPEovDb7RVfUkekttY7TIssqjhTjoy
         ytAA==
X-Gm-Message-State: AC+VfDxIPT03eSYYbSqxH5snbW+dHUOLh4IAIIJ42KVNhpNuffDXls/t
	m4u4nzVAyUamb7ZLMI1vpnxQpsJjN5bjD+s3oxA=
X-Google-Smtp-Source: ACHHUZ7qTw0U1B9WN7xmGr8oF15G8G5ZLinlix8F2DaIMKvMiOefSphIefvgleYhrWVBUqiipgmUub5L7tKP85Qx4H4=
X-Received: by 2002:a17:907:a06:b0:974:1e0e:9bd4 with SMTP id
 bb6-20020a1709070a0600b009741e0e9bd4mr31832898ejc.16.1687985561917; Wed, 28
 Jun 2023 13:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230628091533.3884385-1-huqiang.qin@amlogic.com> <20230628091533.3884385-3-huqiang.qin@amlogic.com>
In-Reply-To: <20230628091533.3884385-3-huqiang.qin@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 28 Jun 2023 22:52:30 +0200
Message-ID: <CAFBinCBYrJGHX-yqCVMm46hdVyaiHrK72Qn8Fj-F623g_Q1SMQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] irqchip: Add support for Amlogic-C3 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	hkallweit1@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_135245_195531_8CD3CC3D 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgMTE6MTbigK9BTSBIdXFpYW5nIFFpbiA8aHVxaWFuZy5x
aW5AYW1sb2dpYy5jb20+IHdyb3RlOgo+Cj4gVGhlIEFtbG9naWMtQzMgU29DcyBzdXBwb3J0IDEy
IEdQSU8gSVJRIGxpbmVzIGNvbXBhcmVkIHdpdGggcHJldmlvdXMKPiBzZXJpYWwgY2hpcHMgYW5k
IGhhdmUgc29tZXRoaW5nIGRpZmZlcmVudCwgZGV0YWlscyBhcmUgYXMgYmVsb3cuCj4KPiBJUlEg
TnVtYmVyOgo+IC0gNTQgICAgIDEgcGlucyBvbiBiYW5rIFRFU1ROCj4gLSA1Mzo0MCAxNCBwaW5z
IG9uIGJhbmsgWAo+IC0gMzk6MzMgIDcgcGlucyBvbiBiYW5rIEQKPiAtIDMyOjI3ICA2IHBpbnMg
b24gYmFuayBBCj4gLSAyNjoyMiAgNSBwaW5zIG9uIGJhbmsgRQo+IC0gMjE6MTUgIDcgcGlucyBv
biBiYW5rIEMKPiAtIDE0OjAgIDE1IHBpbnMgb24gYmFuayBCCj4KPiBTaWduZWQtb2ZmLWJ5OiBI
dXFpYW5nIFFpbiA8aHVxaWFuZy5xaW5AYW1sb2dpYy5jb20+CkFja2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
