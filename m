Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FCA606A337
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2026 21:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j36uJtm7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=CGmKgua4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AM+eS4Le9QJWAs6v2h6n+wkNcIeEiFw/YD/yezQB5Ro=; b=j36uJtm7rZROt3uP201PqSCPmC
	xXGj+CqoDAglEI3ZZBzLxAvfIrqS9mH5d9RuKve1+4Wb03jh41SnEGjEOEcWWOvTTH40L+oNmHyo7
	Aun/+vtJpuSeCP1+NnEFxPoBio9feoI+rvcxbrgfZ4OX5L2PIkr/Qzi/dJE5pR9VuBMHbhNqFyOUF
	plvvUUaHo8x0bGk78JGcg/WcfqcBQLHsCnfHx1dZwWpuYI3lMhonugkWB51jvUcBJmSIl1Em30VhT
	fOjtFIefSMAug7FlFxs1YJwzNJPX3x6EdEECgw6L2UD9NanSK18rYVfrMIObVMvTeyoVjUSAINMR9
	/45BQm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyDc-00000007t8J-0jSe;
	Tue, 24 Nov 2026 21:38:28 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyCo-00000007t3l-3Zwp
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Nov 2026 21:38:26 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8b503e2a87bso53929447b3.3
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Nov 2026 13:37:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556257; cv=none;
        d=google.com; s=arc-20260327;
        b=LczEyW1xgzyTCqLHUDJW3oCb6or2lwVsm7GOktaDGeayjIHuDbovZ+ado9fqmvFZB2
         Cc5sHJSbBDV5UyXVAuXWwZkVjJm+QeWFWUn6/K9W23ErV7r+oYf32jmOlEFaPB46/QIa
         Ih+9fIyQsg61GgmcMLoxL1pTftwu/77gjFjpJWUDMjh7cywEM250NiygarmlL+hhVo1D
         Poz59nq77slMB2cs8iz3rEXo0Qvg0zoyIP5I8gA6JuxbbTgsgVgafH0K7bCJAAamOZ7R
         9WvY+jqyZvNkPRm333byUJErjeLqjhlV3emQTEifgzDF0a4BArUE9FX4xZsE7z39clHr
         +kVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        fh=iBqNlFT9VdEmW9gWQ0vXolD4NGA+AjmsmEF/sUvQ3cQ=;
        b=asAkXaWmuRsueo8KW0eE2YMYdQhmOb3JuRQVB2S755hcp24OqTQKqz5C2B6KUVnODc
         bCrt95P3+v071CaGmn016G0Hfxnk6KcLE1R1OqihVkTBKvDHGBUD4ScgsN61VSeWjfFH
         AoDkJbvZOacHoEuuYsWc/pbwX6kQ0MRH8JsVyD/fUWuj51AX69vq/rgmoLnf35odM5t9
         28qehKcsMKkQXbDFto9keSFFrssQ+yZVVW/gQPywlmNwH45pTbvWAj0mC1hBQYE7H2xN
         U1/huvcY5zTL9pUFhIXY8a5wkSsNqhZyEh7u//lHp9vYLZ56xQ+1M7lJLJeLXcOkYLL2
         4eow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556257; x=1796161057; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        b=CGmKgua4FbjSBNNRh13wFz0G6q9czD5S2SuRzLHI2o6bZ/IrOsRRzHyRzqSBbbT0/I
         uZchhsx5fPTGmaSb3IFOWBsNSSIw6YmZToEgtWnonMmwNSakzGFHtzrjhvwg9KzwoL9H
         QzMDLM4Ow+PX6jrLG50u7upGFy7TY89HAeS8UK2wTEnxOBAxnmv2Ka3GB3nhipJrf6J2
         +g082BK1vLXsM8p0b2EICZz6ZOK194vU3GefuJ2z8JSm7I67mer0uktM074iTAefalJY
         4B0udoYr9KsusssldfpjwV0faUxqAL2FX618jZTswK0zF9xalpImrUpGSm0C9lMIUIX2
         Ygxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556257; x=1796161057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        b=2F2/rTGHvHu8VJ7ZjwEttaYgMGH+3MpUmODLAryaTzeTtz+WxIti8+bMRjjYPQyzYZ
         xai9QkFt+2N3Bxqg3VVf7WTpbcxPds39itjR+BREI/zJ3vQkFe5ya6h25k+9j4Wzurju
         SOM5RY4+g+Y7mpS6qLnT7QlhSa0LZhECobP2yMmyvP9jo12W3NOvjWaoVbx+fzvXNBJE
         PE/HXLHXBu7kYmWTzBYmz4wBY3/asKWjrkAwNZE7/v/wJ6Q//HxL9e1JLZ/T8V9t26af
         svUglN2Igo2BY/36aO4igPXpnXGh6mUzDGlcoephWxE++BzRjqWIdyg/X0QIRrZFtKpo
         cFFA==
X-Forwarded-Encrypted: i=1; AL+hErEKiJMfzzopLyR1XcdrHUBUP/OiAFIutbzYkzzUMqQYLHNwT2SG4D3mJZFxBhsEdTtRa8fyikO0RkkpCoG8@lists.infradead.org
X-Gm-Message-State: APuU4Z8VcYaMJrDk0P+pxju75XXVST84fId0NjF/dmyNHae2Xd6WBmrG
	Mu4WuPd/4zPBwYiAejg3QD1RnXKPNoYRrUxWuupv7xIYIZqCboUl7s4T7PuyfLQ57rvwTY/Rtyp
	M9LEs1OxzCj16f2fitXSPio+gLjPRvSA=
X-Gm-Gg: AZFdTZcQRE9aGozHYGdNGSmQ3eQOjQ8dCDTvyl3qGVZaWljKrfQIPfpDORYwiO5Miq1
	WS+v3IiQSWVG/tdyU+Ci2VjCgHl0Nr6WD7r8Ref3zc/2I59J7wEyWIHriTz09/P7h1KVj+QRukO
	2F8C5NjCsiM9xrMp94fA1iTq3XUh2MXuOd9HPE9tucRafKOx5jiS7LyA1V+LQAus04ESPS2E0Be
	9PzZBEVTfFSL6OHP+C3nfPs+vtUiOsJyhi9G4vWQOjm5F0hgNpZ1Tpm2d1qe8lovBn5s6sSp3A1
	F1qUkjE2NUd8Rur4Qy+DCfYN0QweJDIWVsVuxSYMvhtldKGL9yexpAc2SkiT97urnvZfOMZt++6
	leAK+L9JA4lZJMiSJ9PFVRnRPUvHgLsg31L4PiaSZ/alHgr4R+ctBhA25vdqKqgf90YAgqQ==
X-Received: by 2002:a05:690c:3749:b0:8b4:d6de:975a with SMTP id
 00721157ae682-8b520442f78mr75631547b3.17.1795556257259; Tue, 24 Nov 2026
 13:37:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:37:26 +0100
X-Gm-Features: Aa3M54raaw5cpHc_7i460xpAtUuQL2U6TjCh0nslZW-bSHKd5TU4q_42SX4Pzaw
Message-ID: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
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
X-CRM114-CacheID: sfid-20261124_133738_895850_0B790133 
X-CRM114-Status: UNSURE (   8.08  )
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

T24gU2F0LCBOb3YgMjEsIDIwMjYgYXQgMTA6MzHigK9QTSBMdWNhcyBUYW51cmUgPHRhbnVyZUBs
aW51eC5jb20+IHdyb3RlOgpbLi4uXQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50X21kaW86IG1kaW9AMSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJlZyA9IDwxPjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwpMdWNhcywgSWdvciAoK0NjKSBoYXMgdGFr
ZW4gYSBjbG9zZXIgbG9vayBhdCB0aGUgTURJTyBtdXgsIHNlZSBbMF0KV2hhdCBoZSdzIHNheWlu
ZyBpcyB0aGF0IChpbiBteSBvd24gd29yZHMpOgotIHN0YXR1cyA9ICJkaXNhYmxlZCIgaXMgdW5u
ZWNlc3NhcnkKLSBpZiB5b3UgaGFkIHByb2JsZW1zIHdpdGhvdXQgc3RhdHVzID0gImRpc2FibGVk
IjogSWdvcidzIHBhdGNoIHNob3VsZApmaXggaXQsIGNhbiB5b3UgcGxlYXNlIHRlc3QgaXQ/CgoK
WzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAyNjExMjQtcmUtbWFy
dGluLWcxMmEtbXV4LXQ3QGlhdi5sdi9ULyNtMjQwZjg4NTk3OWM3YzNhODRhZjI2ZWU4YjYwZDM4
ZjMwOTJmMGMwYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
