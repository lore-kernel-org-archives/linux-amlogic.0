Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E40E606A31C
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2026 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AmDk/il2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=0Z34DGH0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q3zznqs4HQ6eRdSGdX8nW9i/iNJR2UKfzGKSPCy8LXA=; b=AmDk/il2gMI6QNOOrKW1aKvgP/
	fDyVE9g2rnoVamOquNNOKGSf2KrWSWdW245H687PQj7aLc9lotNzKDh1biOZcSp2UE6bUBWuWO9Le
	WIiEJkOkFe3h3OGeh0ALhAffBaPkN7hv9qA8MXwXsW6jckZ7FgOs16KU1bkM5mYihsyA6upVviGPu
	Qv9DhB8bug0cKizqqMYdk4kWHUwywGTKIXEizAJuHVAf6o7WWJy7hSSVIjPxSDUhWM2TadeiogI2t
	mqspO61QJT43pk+krUQafMYbAeZ40sIs8pY7Ea3BwAzS3qI7xfyQww8m7NQ09Ds890S7HvWlmwSYt
	qsWxi8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAD8-0000000Gh5M-3f9O;
	Sun, 08 Nov 2026 21:13:58 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAD5-0000000Gh4a-33W8
	for linux-amlogic@lists.infradead.org;
	Sun, 08 Nov 2026 21:13:56 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-67bfdab8f20so90518d50.2
        for <linux-amlogic@lists.infradead.org>; Sun, 08 Nov 2026 13:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172435; cv=none;
        d=google.com; s=arc-20260327;
        b=TCu9dWqJWRGMp5CHWvu1TbC7IhcNSaksnRJQLYZEofUvSHg+1Z9G4A3jEqdPbm/zMU
         2pTxj4ESuzdOhVWqnvITuFDMliBqJWBCv3Mq3McpdzxBDnNEpDs/t7bHx4bi5uhVdM0G
         d+GKdMtWvAuouopsVxnhANj/kXDGnVw92/vRIpOf1P+gEm4HPHIiDmNl2myNc98QXuxS
         jPgVcXNhnpFR8/e97IgSLeyL8H17EOQMo/4a3I0+ePtr407ZbZGnndUmrRvYThVdTrcf
         dLdeU187tXIYRwm2rJxmstxqybjHmAoY0JafZ4VEHSr77DsWKJeOe8po1ApZnBQabXDY
         /Kdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        fh=ksKySFfpL4OLv0MVBzR6zPUbzwhGF0PKHiBtIba+4co=;
        b=g4iq3f0zDGOfAeS9cf2MAaXYMWXdHedcZrNigi/EFWkfvquIlySx5rldkwn81IhNnR
         mmSu9Ke2thJeKRvFQ/B6mcDhHsj8ilyaYqtnOXMWjYgwWcX9jcv+sZreWcLpYmFmOaXf
         2Y5fU0R8dvHmMlrjxasLmqX5vynliPIMKetKsaU/4Q4014QFBJH6zCIqQbiypbqJR2oc
         PsQVMrtHT9Fj9Ees817E9piuUzixCj5A4+sQWvP7lADhteoZh7f4NWWTkruzMXOoodrH
         d0AOOTETfzo/LE6Q3z8ki7Zo0EDt6xqeI+5iV6/U/Ft/h8TpaWzsM1cosQc7+A73jcwh
         wW3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172435; x=1794777235; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        b=0Z34DGH0qLPLW40LAJkrn+8PZbI7OGXW9N+iEHaY+SHGoigv58JRRcfFpUrhv1T9zF
         qjEOryvQP0ycKlDF+GkWhItzPRUBCjzOIHuUeGPzTTqOaFhjQpQ2oaeOBf8i9M1A34As
         7Qk+IR+vNCgT/bV6ZiEAEh51pfL7Klr7nF2tA3xLJqJKs8OkYx/NMI2Ah5+tDYk+KZRK
         MQBiFqUGKfeIoNpD/o4v7UfR1iFAFSNAWQY9BZNeOWWuAIzrn64pZ9EAmJTCL0WasErA
         xTG9G2RVIV1YKNdlF3P/P0mGEog/Ziw5DWy39jSYv/PIem4hjebgPS1+aHI0lttQDFT9
         hEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172435; x=1794777235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        b=fja4ADxOJCJ//5HttlcIrP1mnBBdPBq/ommKyacXVIQ/Hi51JJXUMEKq5qW4zI9HVq
         H3nE4jKlk4xPrujrZXeRDbWQ2u0FhdWJBFoVcVhEIg5UECQwJI/bHJrB7Ie9PAqCg4uh
         fr5lLSyhlmpiMMmgEEKkQ1qLQy5FCJ8C/x0i3jHthCLzKstIbbrK7owJIZs3N9x6oZeZ
         iQ9jgvglnCRc9BEC509H2McyXZKbjgRXOWHI6nkaWqoclebcd43IUe+mbH1pTdJUNX1W
         t/8wWPxb634CscG/MnbRPUBTmvTj1MJPZWc3dD6T9NJAsVro6ycybG4xh2/+oWDmmLFf
         qQbg==
X-Gm-Message-State: APuU4Z9aWQe3cUJtAkGbm480BhM+4/Q/O8PgcJ69XUdL81rJrNLv8gGl
	ZmRM89mR+HqGtifSQI/9De4qq0pyNoy56eSxtBSxuEZvixgTzN8ZxBLV5JWoMFUWfUVqNqR26Wd
	aFkpkJ6hRRkM+0U9DtCIbg4XksUMCU+g=
X-Gm-Gg: AYBFou0KBErK45fUHxm4epaD1ihITNnSErv8+Pzy74aj9dZSKyWi5sK4nxSA24QUvC4
	XqOFnIClpKyVZtdAe3+yDqRvvtikIe2CwYYLQqWRwtnIOwBggyWCZog85YzRKgAptvf4xxUx8ZU
	ObaAVNiao47zpfWYgZe4VhrYZZ7hl7DyJnW/vDloiprW2/hflTm5M5dO+MgIhKAdO8R9TtoByDJ
	LlzGcGgiEqX2/CbQTccxTIpyl5L6zO8SlUkJ1qMt+l0IoyIoM52N2M+uAS8IFyuHpBI+YkwDzqK
	NTrToWG9eExqkRzpgdTtYuT6IxTrV1WJ6TCXzeFITdBBo9TNW60P+5FRHBPml/hoDO3UHIKrlsg
	D3av8I1VvJgF/8VX1XLmdbR5uE5WDMsHECbJorDD4T/sAXqRyqVJYtEdeTZJkDhK1j+QLGA==
X-Received: by 2002:a05:690e:14c6:b0:67c:2674:6992 with SMTP id
 956f58d0204a3-67c3d7b92a9mr1205372d50.2.1794172434690; Sun, 08 Nov 2026
 13:13:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com> <179369963832.2329937.7183164129825631720.b4-ty@b4>
In-Reply-To: <179369963832.2329937.7183164129825631720.b4-ty@b4>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:13:44 +0100
X-Gm-Features: AclHuK8wx9FMQM5aByRf496tUFpAvyiGNK18M8rQvRUAwwPg-HD-rkEq4isW6Fg
Message-ID: <CAFBinCA+4iF4u5qAMh78EVqjLTrx+2z68n2MC76bFHUJYbe3kg@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_131355_779677_A22C5A5E 
X-CRM114-Status: GOOD (  10.09  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMywgMjAyNiBhdCAxMDo1M+KAr0FNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gTW9uLCAwMiBOb3YgMjAy
NiAwMDoyMDoxMSArMDEwMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiA+IFRoZSBNZXNv
bjhtMiBEV01BQyByZXBvcnRzIFVzZXIgSUQgMHgxMCBhbmQgU3lub3BzeXMgSUQgMHgzNywKPiA+
IGlkZW50aWZ5aW5nIGl0IGFzIGEgU3lub3BzeXMgRFdNQUMgMy43MGEgY29yZS4KPiA+Cj4gPiBB
ZGQgdGhlICJzbnBzLGR3bWFjLTMuNzBhIiBjb21wYXRpYmxlIHRvIG1hdGNoIG1lc29uOGIuZHRz
aS4KPgo+IFRoYW5rcywgQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9hbWxvZ2ljL2xpbnV4LmdpdCAodjcuNS9hcm0tZHQpCj4KPiBbMS8x
XSBhcm06IGR0czogbWVzb244bTI6IGFkZCBkd21hYyAzLjcwYSBjb21wYXRpYmxlCj4gICAgICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9hbWxvZ2ljL2MvODhkYTBjMTQ5MjFjOGRlZjI3NzVkNTIz
OGVjYWE1OTM0ZTYwM2RhMApOZWlsLCBzb3JyeSBmb3IgaGF2aW5nIHRvIGJvdGhlciB5b3UgaGVy
ZS4KQ2FuIHlvdSBwbGVhc2Ugcy9hcm06L0FSTTovIGluICRzdWJqZWN0PwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
