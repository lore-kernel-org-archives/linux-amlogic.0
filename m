Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBC0606A331
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 22:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f5mz0Q2M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zLSOwd5w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hvfjgxfZR91PX8BjDt2uHUg/sNX6kAl8Lk97q1xvvgQ=; b=f5mz0Q2M9jrt1/TmUdpmo6sgGH
	1kTJ470IxrhDvI/2gegmBTCzJTS9v3PTOm2ZyJfZERNim9g15VzWpv1GnvFVe1cXMC/vk8nnmOygz
	SGeuLcR1iMEB+fun6tDUCySqJTZ9o1qYrcyS+Xurdn8iLdriceubms6snSUQubyxjAc/2/glcbPI+
	cBMLxK+2/zYeVLluYDSXZJPhWfdRN22X9Zb95IpX30S6Vv/hR6JWRsAe4tUzzH2Aq6ouij/uo6Sap
	GC9aXfhwkQp9AM7AO3EurFtoHJvnXZJVJk7SlNGQL20EcH8Pr3XJXsuC7xygCksQBzZHgiINrcGD0
	06USoKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiUP-00000000cJm-1KHN;
	Sun, 15 Nov 2026 22:14:21 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiUM-00000000cIA-1Xsn
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 22:14:20 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-67db8985419so287829d50.1
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 14:14:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780857; cv=none;
        d=google.com; s=arc-20260327;
        b=Jft5D/r3bTjDx6Oqv8HC7bEc6XCuRZFKuhS13Rzu+csBDBr2dtuEK4WROc2U1qlXhu
         +L4MNynnTZYnjyzTT7eMaXButejgJzzJL3H7t6jyoFbe2D8AJeEnJ4hweQlMvTp998zk
         Cb79R737l4Iulb0W9zrTChsaJAoRjj46wgBjH6CwNT1W/zeF+LEdz+XpuwcPCx2dG738
         btguw4B5906lZF3RcfT6BlfMB5ZRe5WjIQlNbXnp3Qso5VX3ZicciEVbFBCh/XDACff+
         ogAmFIuG2OJbe17e3KhIkagK/Y3UwJqUBthZXwLtBkadRn4Zn6lndfoG7H0R1aL7JmCJ
         FU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        fh=O6STHFibkpW8uzkkkl8GKWu71g0xAX2nQ/s0Lq/cq4E=;
        b=rQHE54sG3fS8nPnZvT0UHob6fwrF5Bzh55LQ8+ZOaWI5zFiaFAuKqJl+B5cMMgE1n6
         +c+3YM6LVab2IqrSxbmMSfDN7DhDiycvvOR6Rm1PSQqKgtKCrTggEWNru/IMN58Z67eR
         xLN+/gz/v35KnGa2ks9Rk6qSdyQDPr8hbLvTBZccga4wlteB2p7iVDlIImHnBIxEB9qu
         POIVrAdGxGcLQkFag2I9+XBcKK38IjXIwf1JSDA13w/Xh0ORd8Ek9zvZkuOoKA/HBrZC
         aQFXjex+vuhQ6lmw0koMXNq7yo8YjLJ3J/MUettaH0azSRRsnfZGfp8YWgARNicU3eCV
         fexQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794780857; x=1795385657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        b=zLSOwd5wypJJwGCmm/VB9woQmuuDOCCb5/ySgqLOt5PU6orn8B8fPZfqtG812yvNQh
         jktdLyBhJckqPIWfRiHpO/cI4k8YHGafo5b6y8/hwXRoCIWfI3J9Qu3NY4F6Iw57hlQh
         3BSblOuOxn1KqRaJ9lybD3m59b2NpEEyj1vqjV+JVvZC0ET41lU45aF7MiuOraJPFEQO
         oLQVhvbdZED3A6jNorLo+bqusnM0S/bBws7QrsIvUSmPcHSEzIoQ2Emu5RcCotzWnJbE
         Ftg+pdqiJSjDkRjc3tJCcZeIHHWG6RCgXVpNWb5oImniG2bx2YmY5h7sHdXhURWq81J1
         T4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780857; x=1795385657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        b=NInkyYWDqmleidcxzYF3gDla3sn93jSce+c8DgtdPccsmC7Nn8ypoQk/E2xyzqT6a1
         sdfNToWKJCsUG/4mk8K4jEf+XpIx4fogTdyLT8+DLz07Gwws71aJgYvC3TB94vrKfFVj
         psj577zpZcu1wrc48q6Pg8lPgcclgnX8LZOD+TErZ3lWxcXWC/i/MPS6LyiFWaUSOZJ+
         QtHnc3rr9vvkbGth/zCdbTK9WnvdeKeiyr/7Z/YRG1saXET/YDiHb/dNsL81frbaGepz
         /vEsXWAcx3bKAAbSTmvWlwsGZzNUV2TsgUt+vDttnu8tzsDooRSIJLe6qYTAxwupaB9H
         CZtg==
X-Forwarded-Encrypted: i=1; AL+hErE96QSCGiSh5HGdFefZtho2M8UWLT1TcO4fKDa+whdPI8urfWkhO836uRe8NG+od2GHzHJXF2oof27fCdgU@lists.infradead.org
X-Gm-Message-State: APuU4Z89c6YmCIFrY1fpVLN/t+t2eNNVUkS4aM95FJj8ohWvNT+Ep/8E
	JCpxzJ8iXBn5Ub4c7UMli2AvAEnoDrPSd/7KsIcwa2TZxts9MIr3VHOv3UzaHgJX1q4FylZfMET
	G+0K3xQZ7z6m+kgxhqk/ucjU+k3bAaVA=
X-Gm-Gg: AZFdTZcUEikUVTDOshHjyzQiA9TRRqCDnqO0t6NcXGkpYQhU9oEL4klBHy3V6xS41q8
	4PBDGk9kKE9WwnjZ3sw0fem1HPDTinYDUEmNh5+3HigDSa4Xa9dSX+Fs2FwMkjmMSP/HlbshCiL
	j6pB9cMTIRiXZWSL9jJCCnOTw4fQT2ZUwhvnj5rNsLE/UdqXmpmkmLlRqcMn6NaFp85oR5Gn0XC
	Uxn2I3DgWAdkzGPGk8F7YU4fti2xWz7J3LfKjV5a1k+ed4YSXTK9SXtnc/gsqcrf2vXrOIoLeQr
	tWYn7yuIXVpugUn+0Ub7mhtc8Vv9k/qGpIDELHZrY3vOwfIntGayDh0ynO50GBQF2uIXCb92LvA
	dOygVYSQYWX7IufCICl1DkQ6BNATB5/oz0Qi58XbDdB/yPNUBbLgbqRZsY8RLKmD5Dcrpbg==
X-Received: by 2002:a05:690e:4383:b0:679:f97f:fdf6 with SMTP id
 956f58d0204a3-67d896a8f2bmr3982114d50.66.1794780857112; Sun, 15 Nov 2026
 14:14:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-2-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-2-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:14:06 +0100
X-Gm-Features: AclHuK8Jibqkumh92MwUwV6k9LdMNZ5aOXfzAlbMwGyKMualpiO_cItbFylPmew
Message-ID: <CAFBinCB_Eam76VJWSWSyLRsnzXOTWohrE1NdqyJ8GhPFjWzfHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pwm: meson: Add optional bus clock for S4 PWM
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_141418_415904_8DDF2B74 
X-CRM114-Status: GOOD (  10.39  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCA2OjU24oCvUE0gUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJl
bGF5CjxkZXZudWxsK2xpbnV4LWtlcm5lbC1kZXYuYWxpZWwuZnJAa2VybmVsLm9yZz4gd3JvdGU6
Cj4KPiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPgo+
IE9uIHNvbWUgU29DcyAoZS5nLiBUNyksIHRoZSBQV00gY29udHJvbGxlciBoYXMgYSBzeXN0ZW0g
Y2xvY2sgdGhhdCBtdXN0Cj4gYmUgZW5hYmxlZCB0byBhY2Nlc3MgaXRzIHJlZ2lzdGVycywgaW4g
YWRkaXRpb24gdG8gdGhlIHBlci1jaGFubmVsCj4gaW5wdXQgY2xvY2tzLgo+Cj4gR2V0IGFuZCBl
bmFibGUgaXQgd2l0aCBkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxlZCgpIHVzaW5nIHRoZQo+
ICJidXMiIG5hbWUuIFRoZSBjbG9jayBpcyBvcHRpb25hbCwgc28gZXhpc3RpbmcgU29DcyBhbmQg
ZGV2aWNlIHRyZWVzCj4gdGhhdCBkbyBub3QgcHJvdmlkZSBpdCBrZWVwIHdvcmtpbmcgdW5jaGFu
Z2VkLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZA
YWxpZWwuZnI+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVu
c3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
