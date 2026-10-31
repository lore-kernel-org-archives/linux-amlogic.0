Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4967A606A31A
	for <linux-amlogic@archiver.kernel.org>; Sat, 31 Oct 2026 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mON7TNOg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NCZ+jROV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fpk80NRirGdYRcPoQ2KiWYOxwKF/eZP8xG9jh5XLHRc=; b=mON7TNOg0DmmtvCXWH42A+3G03
	sDHJ+g/lglvZL4JsWiZJ5y9hO3Df/msB/kIEDJOl9/PHxQtgpZNPSyuZCtrDWEahFdvJysVp1BJfI
	lSeB5vRtmNUyyfU+9cna/jwKkO8McOrgIioCfqbJoPGWs/yc94h8NHzVIE3vdsckronBvqA4HT7Ri
	DEj0n5jIeXgO+7Pqq6lNZn4Ri70jA1oYWxFoiihlSd4PWJw/Ht/fBfnp/9UD0NRzm9exaP/+fvKVD
	DCmT0D5cjApxMHKG+ynDVR5Bx7sTOLXAaDxWA4/hRC9WwrZwEcd3nSnrsf+uJu4/9q4xP/JBR6lmx
	qg3xqq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGVV-0000000DhYy-02QJ;
	Sat, 31 Oct 2026 21:20:57 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGVS-0000000DhYR-0UY9
	for linux-amlogic@lists.infradead.org;
	Sat, 31 Oct 2026 21:20:55 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8b0a921ee46so15781427b3.2
        for <linux-amlogic@lists.infradead.org>; Sat, 31 Oct 2026 14:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793481653; cv=none;
        d=google.com; s=arc-20260327;
        b=D9wFeHwi7Nlki3TMTeZbTucY3hm7FLW+HKgA/Wt+X2ceLb4e9JJakpqopK4jGh9ntO
         RtmNWbIO6KdZrQ1HVSpfV+8ZMHtjSg8E4/f1BHEE1UHp+zNr0WC4xgq/nsSmS/w4q7YW
         3sX6HbJRv8ZLwA40+dPkI/F6Sp49VGip/d/jP/wmobJudd2uxnKINnCgAO8kaQq69GjY
         vQLa344/o5T33siRGT6oK1nvlC/fUkju01u8ybqiKCxpmoMU71vQfqU4hrs3FnYFBL1y
         v2ZSXxguo3yIRFtLQx0vRXMFcQkRgR8yySiRiZ3wILInc4PiRdjqfVIeYk6LExn5sVhr
         wt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ud1EjxEqe05dL8Y9bfg9SJI7KfE4+vpiplmoHtTB6gE=;
        fh=PrhK4bHSLZ2GHWGkVgTchF6Nv7yhm1Rl2tlLZ3lc2kY=;
        b=XUjYP3anwkIJWbVILxlYAdls7wTf1TUK7cRudLprbiGdFRWSmYYg28oBfhUKTOUPca
         AOgIYn4RPiRLQjx0pfnM178iIbYxo8y2tagYE/L5VBOXOKcLyIvnF58Gv/otHyPgkpwV
         X37OPY6IVBSKdTIXxNw9It4K6q7eBmBAUlb8PMPKeG9fcbWt2pF5cHoiV8QQmieaoLCN
         1+xj638s90DgZzlKbqKvYX0yeH3cYWVuCZuufKm0evA9AqTFzzDlLKtnHHPu+Zbf6pgr
         rxU09YQQ8KbQ5lD24JSWA3ude681UEMFrwOHtzCumyilTWGiZTvh0KhE3u2uJDxrsFXl
         26fw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793481653; x=1794086453; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ud1EjxEqe05dL8Y9bfg9SJI7KfE4+vpiplmoHtTB6gE=;
        b=NCZ+jROVajYgGhpwo9O0hO/29nZAQvQDUXSC2Tf+Dv6/iK7qcrc9fmZSEU+P/zCBWz
         XYrATMIavqrKGmUSPPnSF5IASmLyTOdXvOjgtPERhNw+Vs90Ej9PNb6Tol7mxBwfzRgV
         vmRHlkSYoPm5pzeoqqIYCxITD3VYLp60W6pcRDQD3xDfebdMFsRKzFV+W5NEg2SX209I
         0GtxZGwty3yzFpHjif89abCT2WeUJip2yUxsUuuqLr6eWnMhXIkBuGsWjp88iXEkhWgU
         kOLU1sW8Q66JhYIo8k9U9rwCesvOtY2LZ+cVk4FpQjGh/s849h714IPpdwhnjyHEB70v
         MQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793481653; x=1794086453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud1EjxEqe05dL8Y9bfg9SJI7KfE4+vpiplmoHtTB6gE=;
        b=aHwG91ut2s+K2vgjwmZmSOLZTM1+Smgr6qdwYE10oyHWqgflbpUnjC9EViP/F/a8zB
         BCqPY1BUjzQx+eY+6LzXacjWT1s1GM5CYZRjgcHmJ5lfmKhT/GN2dYArsJN95thdM4+H
         gsEfrxK+9eIxNujiAowS0LSCe3oxpRDab48P8AAVOztcL7pzFX9kJ/YBrMKMGawymEsO
         j4UW1AzumGBFgP5DoJa5/HGxRYNSwIM1zHdfXULykA/Q6XNip5OPN20cpipI4joBSUMI
         Z1j101v3Y52K0YFslNNOKMlfbpa00zY32Me92a2hADw5v3drZQgdCfNCTGwvD/+4SJDr
         xchA==
X-Forwarded-Encrypted: i=1; AKwUvByCz2iU2NogTqdkBEjfDC643Ts/idQ253F7tslB9IqZlzShUnNdX9Jp4XPXRy99DSFuj1XLqihyB5oPCFu5@lists.infradead.org
X-Gm-Message-State: APuU4Z8oAd6oFN3LB+YITwAGfqrKtTgpZVsfBsGGarXkJS0O/8ngiJIB
	JHaxPlsNTtUY+FRa4uBAWkNn5L6h8UAtigkXgd30cTcSD+N/ZBQepkSYdzbdAIP6fpnzfDX9Z9l
	1Tq9bGC/ypIOIbALCwssJBzGbGLuAC30=
X-Gm-Gg: AYBFou3XYqxOFpm8NWgzzARCdnw5hraqbe+kYjQEat1C6xIBD+dT+GsxqUNOupYVKbk
	1M3CXH9PMnBGtOyuMHMY1RXmE7lTPr3mUvdCW/qKRe0dvCOUVdCr10/XxPC9W0fEMF3+kW8wMx+
	isBCDADIlYyLjwwcfkZOhDsMael9VqZOfs/yMETEC9a8dHoA+4bc/5brBq2ydPdk7YaPukZGTbJ
	T1BSk9546XxrmMcVcbjmyRjlWbnABItF8La71qs0OkwVxkO/XbzBAGpFgh8DFw/GqHTthY++9c9
	aYNzQpkry6vsb47SaeoHjBsCY3HAl92YmLb2S91MBGvxqCXMP/eERHE0Z5CVuAl8NjetZkokIwi
	9wcVuzUSKLIx+PtlxFW8CjclqSegNt6XnHNhhIRzHlXMSQBUiUgywxd586vgBA4Uzgs6USw==
X-Received: by 2002:a05:690c:c5c9:b0:8b2:9c74:5a0b with SMTP id
 00721157ae682-8b2b67c603dmr27030527b3.101.1793481652690; Sat, 31 Oct 2026
 14:20:52 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
 <20261030-drm-no-more-connector-reset-v3-27-30e71d92c327@kernel.org>
In-Reply-To: <20261030-drm-no-more-connector-reset-v3-27-30e71d92c327@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 31 Oct 2026 22:20:42 +0100
X-Gm-Features: AclHuK_1aBV6-GP554UtTNLhIhnLAZ8a7lXt6NTQKny-HERAzZi4MXk7N7DM8JM
Message-ID: <CAFBinCDqGoX-C=tSvQ_Onjb89ow+wrOL_P43XsoHRYfTgfHxOg@mail.gmail.com>
Subject: Re: [PATCH v3 27/37] drm/meson: Convert to atomic_create_state
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_142054_164043_798E202C 
X-CRM114-Status: UNSURE (   9.12  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMzAsIDIwMjYgYXQgNDoxNeKAr1BNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgbWVzb24gSERNSSBlbmNvZGVyIGNhbGxzIGRybV9h
dG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldCgpCj4gZHVyaW5nIGNvbm5lY3RvciBjcmVhdGlv
biB0byBhbGxvY2F0ZSBhbiBpbml0aWFsIGNvbm5lY3RvciBzdGF0ZQo+IG5lZWRlZCBieSBkcm1f
Y29ubmVjdG9yX2F0dGFjaF9tYXhfYnBjX3Byb3BlcnR5KCkuIEhvd2V2ZXIsIHRoZQo+IGRyaXZl
ciBvbmx5IG5lZWRzIHRvIGFsbG9jYXRlIGEgcHJpc3RpbmUgc3RhdGUsIHdoaWNoIGlzIGV4YWN0
bHkKPiB3aGF0IGF0b21pY19jcmVhdGVfc3RhdGUgcHJvdmlkZXMuCj4KPiBDb252ZXJ0IHRvIGRy
bV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9jcmVhdGVfc3RhdGUoKSB3aXRoIHByb3Blcgo+IGVy
cm9yIGhhbmRsaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBr
ZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1l
bnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
