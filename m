Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC20FC636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pNXCqi6D9IldMPwRT1GeEBp0c4hC8yNux0k+/ZKuP8=; b=HFxfflQsuWhWwZ
	20Dc5i/YXkQbMC8rjmJfamnPS3zu2hOzsF2/5Rlz9tUej3UizBLdCYbq5BkX6vBYacwLD26AEivdM
	9VaU1+w0lS+9p79VftSvgMQWiDcxOVt6Ka9CpxD4coGIZmTBsBOMDQtyuyRrafoI6TCrMphZlkfw+
	5OfvRuWUO7xMxeZVFZ1AsLbHv5R1+NiaDjAYBUZYdhNDkM0RmL3REwfsRn/dzwSHALIlsynak5voI
	fSFsQ1VrWlXYxeTR5XnntLCAiMErT18TgPFvhHhSmphVJJogrQiXUdh+lJSZSZ3O8SxFEAeBL8Z1n
	qQVpmujyk3TrObgzexUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw78-00AFXS-Gd; Sat, 11 Feb 2023 20:04:50 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw6v-00AFTP-DL; Sat, 11 Feb 2023 20:04:38 +0000
Received: by mail-ed1-x533.google.com with SMTP id cq19so5556258edb.5;
        Sat, 11 Feb 2023 12:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nLRzVQJuho4KRCJYHa+XOexCcN/deBQDupu8wqYPNeU=;
        b=f9xAwBzGmKfJzY1ytfGblS1ZpaOHiYcWLlu+ZfXn5Ac4tc2rAHQLEJ62K7WwNuUpzQ
         wfOSeVi+WkwO2eA2KqapekPYswhm30DhaWBG2uNjMkFmYJ5shFyncpiVa4ZL3J59Ua16
         oZ40Qw5scTSC8NJKYSx+AV7JQ/AUqavgKzHS+U3DMfGRAWJkdAlaKuc7jDJsHfPy9I0H
         VlkCtHrlUwO+OUhU88ZtVMw98SYomNrj9JRigEsUW8JTYEL7UPIFB0pc4DepHS6TQhBx
         oItxC/pLELggJ/RVfME3Fu5xiLST6ZGxLeEeAOeT0cl+CIX48oNTNUF04B5FfzzaK91S
         BIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLRzVQJuho4KRCJYHa+XOexCcN/deBQDupu8wqYPNeU=;
        b=J7/kRLZGgJ/gL9XCiJZXRbkNhSbnn5pD0PV/bLLDumuUcNwuYOFHbyfL6SI3cHiofU
         VINPmRnc48IvVBNl+/3Fd2L2acYcwajNXl7/vTN2iMKA5pIwasFTiPgvoF0PdKHXmHj0
         jOIggqJwmWdHio5le/Rj/2XwJCl7GybaYGqrkuzAaPwKkdfxCRXvma+K8Wocn3Ugop6K
         NQRxS+1BctE0VBVVhpuTT41dQWMH41925cYh9M8HQ7DGSF+BZr7358SwzYs7TiKizDGE
         1beR6AOXbhsFCMCdJ4pIttTBTloyl2wNFqUq1pRW8/bYLGBZdVp0uhtTOZ/TNGXkYEv0
         yyNQ==
X-Gm-Message-State: AO0yUKUT77Sz/SyIvLRrA2p1uR5SwDIdAEukS6JLCts1LWl/5/hB9rbm
	dF7/t/rMSIkDkoVcMNhUDvpcB6QRgYkKo8/G0yQ=
X-Google-Smtp-Source: AK7set+iuLmPIjCTCCsATcQ+k96fhQjjtBanERgYOBNisbhTPcAGROv3bck5gIb/Q1JMXZMDge77bhWE4X6sEyF8xFk=
X-Received: by 2002:a50:c310:0:b0:4ac:bb37:a501 with SMTP id
 a16-20020a50c310000000b004acbb37a501mr784270edb.1.1676145875605; Sat, 11 Feb
 2023 12:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
 <20230207-b4-amlogic-bindings-fixups-v2-v1-6-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-6-93b7e50286e7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:04:24 +0100
Message-ID: <CAFBinCDD2kF92TWbm3vktnGYF2vi5zJaY4S2Qy32sK9RcDek-Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: amlogic: meson-s4: fix apb4 bus node name
To: Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_120437_471756_8C692BC5 
X-CRM114-Status: UNSURE (   6.76  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, Yuntian Zhang <yt@radxa.com>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Feb 7, 2023 at 4:08 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Fixes the following bindings check error:
> apb4@fe000000: $nodename:0: 'apb4@fe000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
