Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6A1FD9E15
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Feb 2026 21:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJNgKHZCEM7WhFLvpUVauDmZSE4gk0DNBW6FdbAKIEY=; b=PgqrXRrp8SOef5
	dTDKUgJ6LQwX82yUsHqOEmyFpgQtkG/d/Y0A7gMA5FQOfWO8Y8YCkwqL8huz9CdWrKjXZvu82A7dd
	LciDtrLGgO6K0q/oB5dV2ZzsrOiYSp+VSoP1CDjurRhmsCy97upTlBv4UrUQscDnP9xXtC0q8BEH4
	YO/FFxezXR/GHeSyf0/j3hvwSkCUj2S/Y4lVFTTS3KTzruHb0uoOuntjoe3YAWlr2rpco8NvAT64x
	46SBdOsHQ2NJAKCU7/di3iCFkrH7gwZphw48ruWieTtVoVIYjtwjUkiZ3wuTvegrtzt/MhC8MbzCr
	tGo6i+o84DqeNMRDZrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvixu-00000007Fiv-1Aqo;
	Thu, 26 Feb 2026 21:32:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvixr-00000007Fi3-2Z8t
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Feb 2026 21:32:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2aad1bb5058so12464485ad.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Feb 2026 13:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772141526; cv=none;
        d=google.com; s=arc-20240605;
        b=KgW++rwhH93nuisVrophWyhO/KD0THO6zyWZByKRp7WV900KgVGwZDVTdmncNoL7UI
         GFeAZ/4XXYkXL5J/6ncHKvpN5gBuR2RYlyKPYYuT5XOr3mGxnCeHCYX5vfKcttWxdh0/
         w0NeGfNrcCrck1sE364jwWOtHXk2YTmaSoTFJOfB/w1+L2/iwvOvudly1dESY1xkiUpM
         urzKawLHyB+c9Oziwnt2m4cha/d6V/P1vglIIzFBelBDu3YvDiWBfibZE1DCtCiCUXP4
         3C+zBQy0du41ArV+r7dheirAs+IOE61RdjuFTmLvc6Dsnz3h4MUjnk6fXNWrEzx5FOoU
         RF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIXN27cKt5LsI7McWSFCiBFDokrmQWsOHp+I6lUGsTg=;
        fh=r8ktBHLmQOUm9egb1XjxqBkP7eXJol6gvDzUzzWBKIg=;
        b=ZK0SKyDj+P33q5ae1uj6dNQoXXVIgcPRiyKY1qqOGdV9IoKK1yaCoXXYlJ3GUa/C0j
         hT/nVZDw4ohxVCX+yw2nycb3eFQU69MOoCulvir7RXpvqx8qnpqXrMxircMzdehjRTaZ
         xo9ASZY1Q5Ywn/4pd3ZSaBOuX0gf96Iq+KUxvJ/7rvR91R9L91H0Ov9KoQ7RZecKSTSh
         k6EqSlQryLKxJ9vUdW3M3tS5qgZzw4P1Kx2lksviwWXjQ492DVuUGLPcCapz3vYBZStd
         rLp2e6XXe77MCkx044fOrFTo/vCdDlMtLxMLX7N6IMFbDaYO4iWn1p7E6Wfm7HA76f5m
         gLsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772141526; x=1772746326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIXN27cKt5LsI7McWSFCiBFDokrmQWsOHp+I6lUGsTg=;
        b=OYNCUn9Up7FhuCa18MSRbd97w0pkoa5T1tRG9jRCPfFP+4sEJWTFwqGhi7fNNWikng
         7GwM+QLa/2e45eEewo3+W4nIqFKF2xGLyu1YUN/KFdm7s+qVaWTjEWtEft3kHeNdNs4i
         dLPwwoD9GNyArQqZpJr+IPziTGv/xTlcjhQ18L1IT1OMd0H5sGgnFz6REeRqANcLch25
         R7uqzGE3o4r911Ci8gtNVCiqPXZlmiQIE7rBHHNfzrA04yGJi4VnNFPNGUwoNChrz9DX
         puaxpfjmlu5CjXLaVlpS40uGmSnD3gtlwVDzT0oFfbO5xEFYEvUPL7KL/BTiqm8945Iu
         ShHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141526; x=1772746326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIXN27cKt5LsI7McWSFCiBFDokrmQWsOHp+I6lUGsTg=;
        b=uClYdlzBXyWbza5dN6lwyzOmKl3JLLaOSW8MCIdj0OIoGXX2A+bkdlumpbrRrvzGFv
         cw0AJ4hbOPKxshRijLG8O30JRYjuv8wpOG+IKz5keUA7cxBA+owZMbDUapWlNQEksn3I
         B8sgsTI7OxkTaTMvVJfXt+gsm0PIC+a2hSentPM5mbcjLvtIxcjzynas3Xt3FPQ01E/t
         2yOkghUXyDGvLJDSgsOaUW32uheyN1ZeO61jy+V2ch7F41u2Dw0qwe8zbs6a9TTORhJ5
         n/3Mzi/BNuwEFiJjTbnFGphLIdan0YenVk/LHrLDktkpRYR2Rw0pAUW/S8/9CtWcTXjI
         ndzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDWirJJUvHwAoMOz0vx72uDLnRBxcr0/wbQuN5twNHFM6DF9bmNmQxyyQyLG/hqROnhCC3djI6tdF4fu0m@lists.infradead.org
X-Gm-Message-State: AOJu0YylGECDxD+nVp2dXKpIo0gHLDrL6RNhAtRV4teP0syIEu24R293
	jglMyQDFzoTm7kOzV8TXcq8UIi2Bj0NNxREVnB0XX5LyCDN2A20L5MkkXtvAi0xtqkHfGf+Jnb0
	m5uYIKvm9cjuS/Xkdr2RwFCcDDhoFzOw=
X-Gm-Gg: ATEYQzyVBM5mYJNuxnEsGrZfrjs6LcXMo8Wo72krpHePOMs0ecxk5SqgTFMNPksc55W
	bQybrSRvk6zboTOTf1RFXqbLOkpzPaJs03dJuMgpZu7PvFk2JxJlXcnR3J2I6yDjXvkUgLHURMO
	5jtctVLFl7XG2OhOJp6D7H1wR28qj18EdehfzRt/ktU1YV+hzspNbb0AJeSJkV9jMruj1GcrDFh
	7EiUIF3xjBpTYSbEmahywm4bT8JwEd8WmQNX/EWAqLZhcRCt8k1lA+DZFng6oXwzj7g2JfQ0Unf
	SMxC7n3j3UsHZaAOuc8tXhHdRXU2VxGuocf+vx+l
X-Received: by 2002:a17:903:1250:b0:2aa:e6c8:2c73 with SMTP id
 d9443c01a7336-2ae2e496d5fmr3711735ad.37.1772141526246; Thu, 26 Feb 2026
 13:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-4-nick@khadas.com>
In-Reply-To: <20260123022258.136448-4-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:31:55 +0100
X-Gm-Features: AaiRm523Bjd_ZXG6sxAvgig3lFIwI8meXXnqGhq1qHMJ6dES05oESwn2i1_PAM0
Message-ID: <CAFBinCAc+gWy7ooUyV8zy5+So7dXF=+x3LAvno-f2Au4a-uDbg@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 add PWM LED support
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_133207_674955_3105F67E 
X-CRM114-Status: UNSURE (   8.88  )
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

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMzoyM+KAr0FNIE5pY2sgWGllIDxuaWNrQGtoYWRhcy5j
b20+IHdyb3RlOgo+Cj4gVGhlIEtoYWRhcyBWSU0xUyBib2FyZCBmZWF0dXJlcyBhIHdoaXRlIExF
RCBjb25uZWN0ZWQgdG8gdGhlIFBXTV9HCj4gY29udHJvbGxlciAoUFdNIGNoYW5uZWwgMCkuCj4K
PiBFbmFibGUgdGhlIFBXTV9HIGNvbnRyb2xsZXIgYW5kIGFkZCB0aGUgcHdtLWxlZHMgbm9kZSB0
byBzdXBwb3J0Cj4gdXNpbmcgdGhpcyBMRUQgYXMgYSBoZWFydGJlYXQgaW5kaWNhdG9yLgo+Cj4g
U2lnbmVkLW9mZi1ieTogTmljayBYaWUgPG5pY2tAa2hhZGFzLmNvbT4KUmV2aWV3ZWQtYnk6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
