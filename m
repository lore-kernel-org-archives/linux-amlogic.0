Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412C7C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Dec 2021 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5p/qUfk2IUdV8LFydqI/yp5SHFtuqLqvVnkYifX0d4=; b=uHgEO6SoONS8TN
	FBbzrnB5ONLF02pnK9KAbuWDu+emBo99ElS8X+KrJq4gpCNI/SW+zWCMjtWFVOdZ3jNFMESTG0+f2
	soV09gd/L9N0hIy1p7/VJ6T8eEwOUVrtYVHqAYaVfo22WNYBalbH5paM/G6WWHUSCE8ZJUAMLxCzb
	K16x1ld4CDxCQxpnsUqyxew6g35Y5fecCwj8z3Pk4lP9s/93lBAJlAg9Yhcq3qkHCpng/t1etTqAx
	7ONFn7+ZJL3bl+n3UpOO6uClwll0sia8GJLOSqfVXEssB8KZ5f6Ujifmp75Azo1MH2F2mkwnLjfEq
	UCtExbHEbyCV7Ux3aZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0nit-00EKa9-GK; Fri, 24 Dec 2021 16:47:15 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0niq-00EKZH-3Z; Fri, 24 Dec 2021 16:47:13 +0000
Received: by mail-ed1-x529.google.com with SMTP id l5so492598edj.13;
 Fri, 24 Dec 2021 08:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DFScus/ame76bWpcqZHHvQTmyFNXiXhuTjYyULhGS94=;
 b=mGl0/MzM1+NjhR7NFXNbn/B1UDLF3lkqbp+pEe9C2JOHQf96oIQrTj90KWogmQgDgi
 ctf4pUlYf+OUwMxaCSgFhrS87RgPzckzZAk9q/ksFALfrY9ZhHnz+xUIuZvyeJx1xAwZ
 b+hYxjRHWJIkl3KA9TQluTeN5FYmt4rpDXpYhEE2epnRTjyWA9k1T1zCPenbi72Vy2d7
 ZQiRTilayPv02NthxNNqYgR2kjad0yHkM80SZZBNyPB9v0HbEZB0v+/ips/IeVvvT5PH
 b2Wi/7abKMXs9rzWUTVzfahwSZfWSnGsU36Kr9xA3dyUhRWFoee4YnDtlPG0Qm5hyLYS
 nt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DFScus/ame76bWpcqZHHvQTmyFNXiXhuTjYyULhGS94=;
 b=sccDIM89HER1PvgI0asFZPEEfHyO5NDu+bBdvUWMJZgrFCNs6QVyc4zho+d+Euzq7b
 JjtFP117zaIJDM3Qw1PEKyYp1L/+DJzC8yaCRjhFlnnkjlMy67JCsQR2yXjCg2DVoCKt
 IqJVeL9yKiloJM/KnqSO9aVakqV0PXBc3NP4S0xA9CzNNk7V43672VQAw5k2KYzIaDPT
 wpT3j3Wt75EkCl15IZcW62CoN3GUc+W6rZrJTSupoO2/6IbulwugNtQNJlNgca2cypTf
 jZXrRuJ4zFaqDqRpOTSggl+fKHadBflCJCcWQxl/QNUrNYnYDVv47v+7G7z8us1lzJU/
 1+kA==
X-Gm-Message-State: AOAM533fsYR0l3VCM0ScjbqzBii/YxjxfRtTYNGwDP3Jo3PV2mKdRTCn
 Mgkd8XjufQFEaUzsfebksf7R4t8YY21cTOdhCmQ=
X-Google-Smtp-Source: ABdhPJwF4nP7nicyl0oIWZZzbzuTU42CJYK1j6bdCh/gCrF5TFetfymQCMJE1bt43WmG8gQGYXad64xrd1EHFQ5RX78=
X-Received: by 2002:a05:6402:1c08:: with SMTP id
 ck8mr6521577edb.32.1640364429999; 
 Fri, 24 Dec 2021 08:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20211217073521.35820-1-zelong.dong@amlogic.com>
In-Reply-To: <20211217073521.35820-1-zelong.dong@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 24 Dec 2021 17:46:59 +0100
Message-ID: <CAFBinCA7DXG5o1yc=5HTM4R_yYMBMUPZMWvF1W++PBQabRKQvA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: reset: add bindings for the Meson-S4 SoC
 Reset Controller
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, khilman@baylibre.com, 
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_084712_192219_2EA33EE3 
X-CRM114-Status: UNSURE (   7.31  )
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

Hello,

On Fri, Dec 17, 2021 at 8:35 AM Zelong Dong <zelong.dong@amlogic.com> wrote:
>
> Add DT bindings for the Meson-S4 SoC Reset Controller include file.
Are you also planning to add a new compatible string to
Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml for
the Meson-S4 SoC as well?
We do have compatible strings for the A1 SoC in there as well (just to
name an example).


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
