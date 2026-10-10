Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0A0CA9ECA
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 22:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5m1RlxyIBS1maTtEhJUINsuUkaEGkFN7Uv6MhApqg8=; b=jlMu4q8XTjNVRt
	VIOJ27KsnVj254ahFOZypAGrSN/zW7dqc6RBXNavIQOofU8lD78c7eHSrtgnfAmzQkEQYWnjOy6bb
	kQpFm9l/roymKqLR/BOZ1Sc3cYyhURdVhgD4UEGdxdKLyk2ZVW608O+b0taDwthJ0TVqsV5VQnd07
	KJhMsgTdIrJHvFkI03HHk1amgAJ6+e0SAOgmgk038QiIrbHKyBduEnrHGN9c62D/qh5W0SB6ADGZs
	z7x77YwquX9skHR5Zw/Z860LTE1zzqXMsWQNSMeDl4xzm6aigeOYCXtR7l4DuTSRMxo7Kc/IJOVx5
	I53cR2qIlTA0dnHJoCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfkO-00000008VRH-25MJ;
	Sat, 10 Oct 2026 22:40:56 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfkM-00000008VQI-1omr
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 22:40:55 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-677d35fd1d2so656792d50.1
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 15:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791672053; cv=none;
        d=google.com; s=arc-20260327;
        b=PwNV6XZQnXHF5wjtQ2ztdTHgtblbH88KxiFu3h5nYFwqpbUCjhAcN9yuUZt8AnAuQv
         9E7gZR41XLUUxBhDT7xVszmrVc43gwp0lAH1S+01D8GOpTpXM8YUD6dQqi3N1sNZi1CB
         rOL9mIV5oB8+xbnZAYHI91L1S7R0dojPYwQL6/V1OlaNtCZuvaGM2NUXrJjZPf/M3qwQ
         LFYjsHqnQt6wlzdokAhrs0cYT4azT9tyRNDjpHzERmEDH8eaBfCrJ16E5ZPEmZYe955V
         AfXs8SporPE3TNF9Nk9d4pGwgyLbjxJYrBm1xTcYWufHN1JCDXIjqZ72yHyNxbW8IEh4
         FndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        fh=Eq6QVlDJXKXqcXfk+8X8ze4a0GluUxh6xCaV5bjGcO8=;
        b=OLCLpXWZ0FhkjjFht9NmYc8zc79JP8LDJlGvndiQ+rgYGAb9Roou58a0vukgVZWWlH
         dJsK+TGZqRUau1lDK2Bgr/y8XYgcrK+RC1e98mGdwuWX7xPy6dfvtm6x+npcBQtt2gDJ
         ldF2VffBj/L0TUrI5cFW0yEx0anB22M+nHxEVHdrUJ5NukjGK/SuvWdW/qC5haOaLkzw
         d4syrLzqmU+WRr/cpFZ/hvG4ymDQUQTNH8j+FAAq6/9uwrzU/+Th2KJd46bxgLvskItr
         t0K45wtgOAsGGIm3LuSMzgB66McxpYslavAGx6wHo/Q9k5BDO756GoJ2/gpg6o3VwcIu
         jNXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791672053; x=1792276853; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        b=Z9BkCL38bZPALarNIkNHjtdJDn+UfTzr7AiuY571jjbvc3Cos0qfkI0HI9S4peTXjG
         TsvUg7GzdYlg7HHFoOMfAGilKPuEN3gR4YOsPQArRz3xLQJeqstbYvBumLlID8SN+N16
         ZxAWJ62iSwL2Ny39w8d90ezSIykl8rUDO/lV0HrNhLVIc25d5rMvfdgW9VfzRLM8rzJ1
         +8tjIjrzRMHkH6xaY08JuooGfqPT+ttPLpVNoNsxi4eLkeIDmqHHvGpQpKq0tOk+BW1+
         s/3RSaHRn2qVhwFrklGLdqZCmKGG0HaMvuf34xVG99tQKJcOBXK3u/0AqmVF6DiX6nQi
         kx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791672053; x=1792276853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        b=X8D1xBp+2SnSs2FW9uqcl3w9D9pMNtFNq587VP3dAw/sR7Jc9Msq9IE3WYPsoAhb1C
         EX2OFvWrCFJmPHeFa5jILrXtgVWfcNZIrAtW0bjLZjRkv6XqcRxlXhfZBMes0ZfDKHYv
         vW1R6BctqndrFM+KA9UzPIMXMh2AxoOxy3Fy8FEdkriVbRK8nzzAMY86ZLajDYyIKLUF
         7To6QCni5YhbIYYIrrtqKGxyYPrQG/MwF4i7q1Nqq+8wZkWMzjhy4840yMmyc7NqCyQ0
         /p4pLmqC93i2XmNzhQRlMK+5TAasTsC4cXumGxKiS+epqpwVHMw7v9U8mypG78k0ULiw
         2Vag==
X-Forwarded-Encrypted: i=1; AKwUvBy2KtaptXUtq2GrMRtQNytMsnXOfH1oYBDEYFDDDnkCsnnVdLmQkgw8Q+GlNt2ywncXiPHO1Ab0Hk4mqF5p@lists.infradead.org
X-Gm-Message-State: AFq9FYJsAUKaBWWbRAZdkzRmYL+WiqKax3ppSkGn7PSb8LGWQnGR7UF9
	xxpwnLcHkRRpmuberjKr78wlmu+SLrdah9Qg2FgXO2jk0vNsFi60FwYIqIuxfVLuZswy7ybDTHp
	FkV6AkDoERWQcAHXffKPfZFT3SUaPGaI=
X-Gm-Gg: AYBFou1wuGDgtfWwueVbElKQgtCP8GSKQV7i+PKZfKr9R0FpqN+CgNxdAMIaIuYLRMx
	XiInhUS7NiKx23x1KC0Iw8fXWSRA2Pa84FIoHAP/JGWpnEj3DhrybjrT/Wq2xONziIK10iz1aiP
	1pciT7JCJvZWMhdJHqi7Bw/0T0VJKS/q9xuTj4dqOTZsjVMZ06clPl+c5lGDqrw6dY8ZpTi+KOl
	W0Zhhwft7fP/O3TBzL8Yj1PQ3ugRkwNQ37H8AqbVJNB1yYhsv5N1mbd2yoz9jxD2XyOAejqP0C7
	+qG6vQ3eQwJERgVkeD65ZnYvZqizQccr52gkVsDSC0ckPe/Nb10hJfSH0zhY1u5S3vnB4utqBQw
	v2wkYEbW4vBzA
X-Received: by 2002:a05:690e:12cf:b0:667:e855:ecdb with SMTP id
 956f58d0204a3-67935edbdd4mr1914994d50.3.1791672053242; Sat, 10 Oct 2026
 15:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-4-tanure@linux.com>
In-Reply-To: <20261010105900.247342-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:40:42 +0200
X-Gm-Features: AclHuK8sus9eXHW8D0kCsjiICdQbyK-pql4xQRfUyDiKVkCN64EjzyryJR6PDrA
Message-ID: <CAFBinCCaAT8+YjSwg0=aFF8mbN=j-MQ=oWvfwUakVE8O-eu93Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_154054_481230_A6C536CE 
X-CRM114-Status: GOOD (  11.86  )
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

T24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTI6NTnigK9QTSBMdWNhcyBUYW51cmUgPHRhbnVyZUBs
aW51eC5jb20+IHdyb3RlOgo+Cj4gVGhlIGdsdWUgcmVnaXN0ZXJzIG9uIHRoZSBUNyBhcmUgbGFp
ZCBvdXQgZXhhY3RseSBhcyB0aGUgRzEyQSBvbmVzLCBSWAo+IGRlbGF5IGZpZWxkIGluY2x1ZGVk
LCBzbyB0aGUgVDcgY2FuIHJldXNlIHRoZSBHMTJBIHNldHRpbmdzLgo+Cj4gV2hhdCBpdCBkb2Vz
IG5vdCBzaGFyZSBpcyBob3cgdGhlIGNvbnRyb2xsZXIgcmVhY2hlcyBtZW1vcnkuIFRoYXQgcGF0
aAo+IHJ1bnMgdGhyb3VnaCBhIHBpcGVsaW5lIHN0YWdlIHdpdGggYSBnYXRlIG9mIGl0cyBvd24s
IGFuZCBubyBvdGhlcgo+IGRldmljZSBoYXMgYW55IHVzZSBmb3IgdGhhdCBnYXRlLiBOb3RoaW5n
IGNsYWltcyBpdCwgc28gaXQgaXMgc3dpdGNoZWQKPiBvZmYgYXMgdW51c2VkIGFuZCBhIHRyYW5z
ZmVyIHRoYXQgaGFzIHN0YXJ0ZWQgY2FuIG5ldmVyIGZpbmlzaC4KPgo+IFdpdGhvdXQgdGhhdCBn
YXRlIHRoZSBjb250cm9sbGVyIGNhbm5vdCBkbyBETUEgYXQgYWxsLCBzbyBpdCBpcwo+IHJlcXVp
cmVkIHJhdGhlciB0aGFuIG9wdGlvbmFsOiBhIGNsZWFyIHByb2JlIGZhaWx1cmUgYmVhdHMgYW4K
PiB1bmRpYWdub3NhYmxlIGhhbmcgbGF0ZXIuCj4KPiBBc3Npc3RlZC1ieTogTExNCj4gUmV2aWV3
ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IFJldmll
d2VkLWJ5OiBNYXhpbWUgQ2hldmFsbGllciA8bWF4aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgpSZXZpZXdl
ZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
