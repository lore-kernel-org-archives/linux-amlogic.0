Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E91CC7618E
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Mar 2023 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lc+MABeOwr949c3QUjFb0h6R7WHzenlh1kTNwSNsv+Y=; b=kRQ89Bfi2BHtbt
	HbWhXOgwsqrt1cMivocxMhSRQDqtL1LMFmUECQMCSJ8Y11lPfs6jIfcrY7Yxx+rZE4EFtvjRyheZg
	hmMOcEcio/EZPBwvXtpi0cAyxTCGJfq3NR8VTTnlHCdsE2seTh38tk4gT9GXAadbdrDHwbyKmV6FX
	7lDEp0WSHug2bC9uaxYYb27S9w4xQQi8EuZnzkIayc2ERsgMy46kFONSJCwe39cVCsN8pb1Xdie0B
	CZoDuPiFyJklBsyVBzhvLgM6MIgSE6JH9YaOGZVDY4VoVoEBdBMjbcvGKfDZRinzuEZYQTfhG/2xG
	OIWX/d7TDCM0BkP/TqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdcY4-005Hqr-0i;
	Sat, 18 Mar 2023 19:49:04 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdcY0-005Hoo-2N
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Mar 2023 19:49:02 +0000
Received: by mail-ed1-x536.google.com with SMTP id eg48so32547373edb.13
        for <linux-amlogic@lists.infradead.org>; Sat, 18 Mar 2023 12:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679168933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiugbEJX8e4tBR8v5WrizkFrQvCAxHo92Z8AgfyiYuU=;
        b=TAdAXNRbn7vxfUflIzjabTSIrtlEfFeb7PkwwR+gZ+PRgiUx/D4T2GPf9ziaXyGqHY
         ugzsDlfiFNHi3rYsSibOyy3I7zrFRDsbxxCQGWKIptxXkoUWOfBsYyRbhueYNR6QY1vb
         RYTtBKxRZI2eb46kc69DXbblmouCAMUvabgy6FdvBRIuyCh2ZpkZV3jbiUoiVF9TqeQK
         SdzDcRAXL6djJA2bGDyuOMtMDV1S4ZOcThDr+2XiTpGCJKUU0seWWuswifS0Box+FKyi
         P9cJ+y1gqy1FgGKC3XeasyVWlvvOK9s5Zi6OVFvYA6+xG7h1zmfgKu3I/ZE+scdBuABQ
         H7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679168933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiugbEJX8e4tBR8v5WrizkFrQvCAxHo92Z8AgfyiYuU=;
        b=CRM2UJYigxidGWUW5NSXC1PUjsTPsCqvY8VonmZzXw60Q7NRR6lmcWcLTL24BqLnAJ
         7CpqWFORKLkLjbCG9TebL8dl5UkvlPGS+woW/UcBzQjTDKbzMNJCSrfxCWDM71xJXLwx
         pq0IRI9rw5ymglQKYRyZWeVr1FECkJdUVuOSxHjB3tiPKMFp1hpoa8oB992vdc32L+uj
         OEYP6xOPDXagPOesOizhdDOfUlLfi6BUhIUA9zCwaZ+uadxHEsrSVXCsXB/6O6BDsclw
         jbq24w7SAL7Abh/vk8JFrZluFHlvAIcZbkqhmOHI+MN32nzUx+0j/1JJLMkXpgH9oOAE
         hg7g==
X-Gm-Message-State: AO0yUKXGjNxLwL3Kuz69qmrZFJ+lKCkYgeCyddipqbdgxijTYVnI0Id2
	3GYzC8bge404fS8iqeaNE+kAgyirDZpTHLH+FN8=
X-Google-Smtp-Source: AK7set+2wo8PTsdUJYcZlYuKUue/uK9itVzfKPEX5A+p+E1AWA3LaKu3QuV9nEvRcwUlT5FIDwTsb/G8zm9tdenhU8M=
X-Received: by 2002:a17:906:bc9a:b0:924:efbb:8a8b with SMTP id
 lv26-20020a170906bc9a00b00924efbb8a8bmr1713848ejb.6.1679168932708; Sat, 18
 Mar 2023 12:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230318144412.75046-1-frank.li@vivo.com> <20230318144412.75046-3-frank.li@vivo.com>
In-Reply-To: <20230318144412.75046-3-frank.li@vivo.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 18 Mar 2023 20:48:41 +0100
Message-ID: <CAFBinCBFXok9Of0dvZCZrw--LdFOihdLOEWPSF9UA5Nuc5eqEg@mail.gmail.com>
Subject: Re: [PATCH 3/9] thermal/drivers/amlogic: remove redundant msg in amlogic_thermal_probe()
To: Yangtao Li <frank.li@vivo.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_124900_814498_2CDE3900 
X-CRM114-Status: UNSURE (   5.62  )
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

T24gU2F0LCBNYXIgMTgsIDIwMjMgYXQgMzo0NeKAr1BNIFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZp
dm8uY29tPiB3cm90ZToKPgo+IFRoZSB1cHBlci1sYXllciBkZXZtX3RoZXJtYWxfYWRkX2h3bW9u
X3N5c2ZzKCkgZnVuY3Rpb24gY2FuIGRpcmVjdGx5Cj4gcHJpbnQgZXJyb3IgaW5mb3JtYXRpb24u
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KQXNzdW1p
bmcgdGhpcyBpcyBhcHBsaWVkIGFmdGVyL3RvZ2V0aGVyIHdpdGggdGhlIGZpcnN0IHBhdGNoIGZy
b20gdGhpcyBzZXJpZXM6ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
