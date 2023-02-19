Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C0EC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Feb 2023 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gpZC6rQDIP4iuI74jrJW1Kx+6JeYugbd7GDKFg28rI=; b=Dmkh+w30GfRBig
	qo/OvRziCWex4b8z3vANJgKbifYy0DbN6xwnNhBw6EqcW0AXCG9fMCMULbMAhetEgehTcktBbfWPU
	MHuFmOxmekUbvGgJZvbWEMjGKSCuwt1dH5r5Ro9br1bcXfxFPka9bNSPCX4oRTM7DFs4PTeMPBv1T
	TGufEDykWrLpFuGR9yN9SYjPn86C3s0qiWi8qS4Qekjo12Eymiad83ZIV3/CqdiSQDEdwMAnkiwU6
	8u4qNUtc4bMe1Qtvb9XSTwCFQvC1LXzX+GjhyEygFAIYYqv8JXno5tBY0ktlr7KlRRFuGTT8OQ1fw
	+ORI2OFsSZ6DFxHRcAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTnTw-0021X6-MJ; Sun, 19 Feb 2023 17:28:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTnTm-0021Tq-2i; Sun, 19 Feb 2023 17:28:03 +0000
Received: by mail-ed1-x52c.google.com with SMTP id ek25so3337822edb.7;
        Sun, 19 Feb 2023 09:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uceSLfTcrpp2TxT0t+zM3u/1SNJQwihc1mRmxGjh/SY=;
        b=JNVWymAHxpqHkh7RLIUhXRV9m0Mz/kRVeTx2aURgVxnkF5gnikUKbhHziRVkde/M3O
         gIQZZuGjc9O8YDbGlriq0QBD/1uyAc/Fyqj41Tqi8pjaPIBWnfB4Ve+cXEC/3arzK3Dm
         01TUYmdN03WXyzqQ6gPdexuKg+OrBSuF8Tt2m8IQgkau+006R71G55Ursrv4/p8LgLkx
         Z1LKCwBDaSuY5IYhiVbV9V5MaLtznKVMGCgNCl9IPIyKS9zK5ma/Hg6+5HRXjmcmL0D/
         QqnjPlreXzTxNsckXwQ/K0q0arqwoiqIclZdKoOIV2lLljUjwjJK0qnkdm52fhrIuJ0m
         tXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uceSLfTcrpp2TxT0t+zM3u/1SNJQwihc1mRmxGjh/SY=;
        b=T3QVnwDcPz4bwVTHYhdTFQ8X2RFUVRp7zi4HCSeBij8u6h6dhw2+vwTzqbadczqhDF
         WuFl4dIYkThsl3hvTQQTNJc3T8auPiZfKU+gMxc7HisYESvXMyRuhXMd15KcTu3vUPGX
         6vgOp+wNMxfTONJzExKYr/OXSBuA8JdSyctP4dNKfPex7jfNYZcfMnqPCsup2wDHjbis
         YSgRJ8bcSsZs8J15wMbzBPVbNtIo/QLUMWIp27Vv+DravVk/kFo7nx5o8VyqLhaA6cvO
         tMoHo12dWonrpMV11wRKQrDZlztszup5+NeijGIl9JpYlCCkp5y8Mx1r0I/xtaMDoyut
         VTWQ==
X-Gm-Message-State: AO0yUKUycxreaULx8UeG/vjPPb3RueeJ/7dq5zvfQVhSbaREUbVwu7Io
	M5AQwu/vHSbgjTRnoLZp5/0JqOkkxvbHpGeRno1F5fIl67k=
X-Google-Smtp-Source: AK7set8zR7Cd9va+awR8PhxfSuqRAd8HKCi0xciYlAGKLxP71ZvO0916KwyJz2bydQ1QrP6ZyoF8peOQbYYBvGSGYpc=
X-Received: by 2002:a17:907:2be6:b0:8b1:3cdf:29cd with SMTP id
 gv38-20020a1709072be600b008b13cdf29cdmr2852937ejc.6.1676827680101; Sun, 19
 Feb 2023 09:28:00 -0800 (PST)
MIME-Version: 1.0
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com> <abd9a2ce-5b9b-c6bd-d3bf-8791d4005231@gmail.com>
In-Reply-To: <abd9a2ce-5b9b-c6bd-d3bf-8791d4005231@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Feb 2023 18:27:49 +0100
Message-ID: <CAFBinCApc0-_BWaUmtiBuFEN+=BVDVoo9boaxnYPsjfktvC_Cg@mail.gmail.com>
Subject: Re: [PATCH 2/5] hwrng: meson: use devm_clk_get_optional_enabled
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_092802_137400_4C157C78 
X-CRM114-Status: UNSURE (   6.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Feb 18, 2023 at 9:59 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Use devm_clk_get_optional_enabled() to simplify the code.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
