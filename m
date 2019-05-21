Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3022C04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 17:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7487217D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 17:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hnjoVM9z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="vUhtS+rY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7487217D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezL3+Tibc4rBmsYai3JfHPfpUaGFZ42MSMkNzRnfYak=; b=hnjoVM9zmldb0R
	FdVUDQwg9QWjsBBhcL2wgQATZCGzxebM8J0NjNe5WEzQBG+u4q+gmdTQ9tTm2yHydx0GIalcAGnzU
	Moc/Qk05AD4xhuo8bezHmkzIMU58VG5lnTzuQkGjrnyizX8A+rXg/WhVhpKWIoXA7D+aS9h52Yo5a
	6k+UG1CPRoAFHUDNmyOKggji/KzcrvU16Dzl6DsaNCQg0utPusqgRWx2SMd06T+EW4Q8BYmNRAdAh
	0uBYVh+mKWhSnOCnwZg0jNj4EhwZ95Hhg47PEh/jSTt6rattx6LoLDqMKJQBkwXtUprpha/mkfKbB
	f/y/VYYQhmSwfIuWsMVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT8b5-0007PH-SE; Tue, 21 May 2019 17:30:43 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT8b2-0007Nx-Gx; Tue, 21 May 2019 17:30:41 +0000
Received: by mail-ot1-x343.google.com with SMTP id u11so17078823otq.7;
 Tue, 21 May 2019 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/9NBxGWR7DQfsNAp+UB8rtdlEFycVGIN+18JmsiYGuc=;
 b=vUhtS+rYX9L7zrYqAWyLBRvFFbqk/RHqIizF7drZi52M8bmoLwhxK4PSijJ+uUIfqF
 rLP0jDniA9pfsOBlUmWsEtXBAeUc1/niCJfPqU/iQiqGl6XIF7sWJAeexI80nUwKxjqx
 r3VEK1k81IkqsPC9VXBMoA/saHdq63zxZm4P5HjLjTRJgzWb4q2u5xNYii0rJrYQnyNQ
 wCyxAfC9ULgZjosiglk7uTRpT1QrC+aeOEt7ShH1+Ys9v7DYYutg4H7xnBBhO8QkqDxW
 kABm7cXkC3E4ala2PojMu41af8nsStfOwQ/3KIKerkFrJzQpyHjiK4yZVUB7ducP0Gar
 IukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/9NBxGWR7DQfsNAp+UB8rtdlEFycVGIN+18JmsiYGuc=;
 b=GLbRPQuIa6zep8Oc/FM0oiylbsLpfbWxUEwiL13l3OW+MQtcvDbUeCSdIpOr39jRus
 vSiaQ6siuy2pSVlLUOLSKPa935/wxw6gE1vfdUs/UlCgL9WEdTgQ4pfNZKmVxHHkDHJs
 czB+7QwiWgRzgHXemaWqhfvptuoY87astELGYJ2rBknv05wgP9bciNNFqE1bLFK5PSlY
 JdjN94VKlQIWhgJide/O3e5IBpolu+m4xzZ/ZchZoW7dqC3+/vUjYrGqmVzs+Cv4uEwo
 jTHggTtLK1aRpQPlVQMekolDqaEkUB9N7GnOsmJC/ZFNVZ0rdWVY+RM0RI0IU1UpBKLg
 8o7w==
X-Gm-Message-State: APjAAAXJW5dVHB+PQbdIML6GcyqvgiP77MpeXxIiuGaerXT9DUBlzc2/
 lp7ubRv4pbY0jo9+sLpxuymnxkPGDFgBRrEc4r4=
X-Google-Smtp-Source: APXvYqz3bsCqphTyB2v13j/v7Ohjzl6D44cpTCYwzD61Mga35oYp7a+Bu3LOVZ458XKaNJoA+kmPDHcyl1gOxohdNA8=
X-Received: by 2002:a9d:32a6:: with SMTP id u35mr37879265otb.81.1558459836920; 
 Tue, 21 May 2019 10:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190521150130.31684-1-narmstrong@baylibre.com>
 <20190521150130.31684-2-narmstrong@baylibre.com>
In-Reply-To: <20190521150130.31684-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 May 2019 19:30:26 +0200
Message-ID: <CAFBinCAwD7W1zQ2YZgecowZUEnoVpGXyGQnOKhB5T3OvOvvbkg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clk: meson: add g12b periph clock
 controller bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_103040_562345_1D1A7FF5 
X-CRM114-Status: GOOD (  10.74  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, May 21, 2019 at 5:02 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Update the documentation to support clock driver for the Amlogic G12B SoC.
>
> G12B clock driver is very close, the main differences are :
> - the clock tree is duplicated for the both clusters, and the
>   SYS_PLL are swapped between the clusters
> - G12A has additional clocks like for CSI an other components
I missed this in v1, it should be G12B?

>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
with above typo fixed (assuming it is one):
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
