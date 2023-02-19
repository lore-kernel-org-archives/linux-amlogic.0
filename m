Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C5CC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Feb 2023 17:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9beJckpBQZ40ZQZMfuOnSVKzHF7A5/i2jGNM/jIQTvQ=; b=GbipeUE1ke9E9V
	AMYqQFufCD6Shexvn6uNn6SlDrzRsho/B6vR3GLMo+bvWvSNcoGTeOlsrY7MbeTlGJi2S0c9wxUEm
	PSSSnk7WJFiRn9kVX7DlhmtG9lB7bN+1MGvQFqNWGVLJw2+i0O+foMqB4Ms53Dx1iakmQ17VkcuCj
	wBj7EhNHFw2SAS/a1ZHVUEqqLVfPKOTc8yCBAeG4yd3vxoUqGjA9ttl+1AKexTYN2U9jw2emHrDVB
	gESN2gLY/mChyTt8P5e9lrY0FGHd4TYVCMXo1QB3/4zgpsH3y9x5vrtWTTnGwc3KjNqKxDiyc2mQA
	a4XYxOiJN514afrII0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTnU9-0021bZ-Tu; Sun, 19 Feb 2023 17:28:25 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTnTx-0021X0-II; Sun, 19 Feb 2023 17:28:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id eq27so996661edb.5;
        Sun, 19 Feb 2023 09:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M6+Yhi5HmzEaYR1Acp/Tiu9ai7miZvMW3BFnNCGbcK4=;
        b=DUffLC6/PkfvC5KK7qPuoyZfR4td2wDofuSGnAXnqS5FmtiVogvk3EMDWqnMNHysLI
         ysIg2jOM7yHguOWZwd46Gm8uGpMUsP5mTYQPiQ345DJCNcizxrNd3sSg6RRsGj5MsD67
         qBB3S6pNTILI1s+rc2CGjmpKvrN9VjOFZl7t+vTuwUynUgEtyFKayhHldGfsVHpC4FRO
         WDF3XXdVIwNmD+/NMDhOUf4+qzAeLk1EqYeZBf7wQN0s5UjtFptWcISIrwZmfSO/cZvF
         elcWmmyCkbTspJwPmSrzWBGvh0nZiNZwjwVz+vSpY2ArSLoHha59Ab5t1oF+24u6XxC6
         ovTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6+Yhi5HmzEaYR1Acp/Tiu9ai7miZvMW3BFnNCGbcK4=;
        b=QJkuLDaQah8YEXrc+LmaRDhqsVAP5PKBlYKQOtazvR9y30NrqieY6jH/Nw+pe/FVWq
         NkWnoohNHRTnbh3LaFRwpfQuU/wj1qhyiRw24urlTFU/H+avPohYYYhBN2zslp4meFg5
         zPrnatDnz/krHAAuzNxLJwxVdNDY5AkWtG5jVLlfvVS+ZljXKKPhiHFnnJnEdAeBgeZ4
         uvqwm+o7OkrlAkMx7/7jbywoziwOBntyVCbXHSHC907506qeIERV4hZOv8yVSA8v8Tkn
         YO4ofNafnkMytrsvk3pkSdj9gzIiSO5Z7xP81FJ6++yBB7Zz7+bO6reHUQ8aOuFxbrcR
         2FCg==
X-Gm-Message-State: AO0yUKUEXCX6/wuZxlckzItyRbcRywRb6grgvdQWqg2U7ZfQBSjL+Ji8
	SZjkUT4M4ZqoeBw+P22IYoL+7DqLkAS3MOvpsxc=
X-Google-Smtp-Source: AK7set9VhggQuyGk7wz7IT3ufc2D81c5/+i5d+bwf3B1FoqxAjUyKmwz22UJUEaE+wpg5oRmnnQWN/aGG5VAMrRXxwo=
X-Received: by 2002:a17:907:2b09:b0:8b1:cd2e:177a with SMTP id
 gc9-20020a1709072b0900b008b1cd2e177amr3898709ejc.6.1676827691866; Sun, 19 Feb
 2023 09:28:11 -0800 (PST)
MIME-Version: 1.0
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com> <7d1fc713-850d-d9cd-3fe2-60fd690f406a@gmail.com>
In-Reply-To: <7d1fc713-850d-d9cd-3fe2-60fd690f406a@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Feb 2023 18:28:01 +0100
Message-ID: <CAFBinCBGxectv891GreHtYLvk7mS7F9DZx8_dVA=qht6Beiz3g@mail.gmail.com>
Subject: Re: [PATCH 3/5] hwrng: meson: remove not needed call to platform_set_drvdata
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_092813_886099_1127020E 
X-CRM114-Status: UNSURE (   6.32  )
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
> drvdata isn't used, therefore remove this call.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
