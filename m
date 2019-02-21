Return-Path: <SRS0=rvs0=Q4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F391C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Feb 2019 17:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6133520818
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Feb 2019 17:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VlllHyti";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DImBAfQf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6133520818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QETDiBtNlNiDGqb/TO+7c77Nbr8demUmSOv5J/GFM8=; b=VlllHytiLUtfzU
	HXvhNaM8kyPEUWTA8TkAcobdTk7bBHCLg8Z9fa4VpTWaHatt1f//TzZtSil3RM4+qmi0u1lmaZBh7
	DTdLacPcri8Hf2wuDz3qYqN/8XlSnmhq2Vj349ODYYyjhUTbqwMjmrvVM3LrgDsSnKPn+1LNln4R9
	g+6tsEKBR9utUww4/m866394oVrXxx9sZdkQnc9ahFZK7q/z06Ri5FlYQcjn9PlN7CtYfmjrJ9xis
	gCJV71lAaNSj47yDQySOJIsMAz5WAWOEWdkv6SFoXxBLIwWoPvBvoEyz9EGmPyGv77XRsRIQn4ft+
	XIJu6Q59ODn/GXm3V8hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwsR0-0000y3-4O; Thu, 21 Feb 2019 17:46:58 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwsQw-0000xV-6n
 for linux-amlogic@lists.infradead.org; Thu, 21 Feb 2019 17:46:56 +0000
Received: by mail-wr1-x441.google.com with SMTP id o17so31598997wrw.3
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Feb 2019 09:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=F6kO94A9IplzmxVbouLWYTyqm+5HmQJxHJGylQ2S1II=;
 b=DImBAfQfPuyRrDzoY+7cycvzytgZL+fvKaFR2Fm4gsJ6JsZSjxIVAR6cRZ82J3cjcN
 Rj6AjKjatuAGU6PERHhKI772jWX7Lb3AYd1sUe9AYPphbWkSem4Bph6jf4QI6yYHgvE7
 m96mxCtSOoNiURsGAtzZZy1sgpyOcDzAQtbUWX4+4/0UHcXKY/XNQ3AeZ/nIciKREK7M
 2nXVWcGTbeqbWo5KOzxGd7inZBbmZ6sztWZZGncIP0XRn8/Jh4UMPAIvN5NY+4riPrLG
 tfAZfu2YC6lE24qcBJLK4U6MovfhLKXw0BNYfxZqV6BUrN+cUrUQ2dhle9Cd9a5pfG/0
 rSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=F6kO94A9IplzmxVbouLWYTyqm+5HmQJxHJGylQ2S1II=;
 b=E3psqbbqLORf/8b6vtMXQ/p+rHno6+ymrk+dePXBm5ZQdN8uK1OOshPfhoeMcuqbVH
 FTR7VuttlrhlVblpj4PniLjrCKYPXNhQcs4FWtbmP/s4VFIffVMmBekD1mNWG9crUY22
 ktRbfPB3oebJ7Rbfy/nyakmF+PXdDq97ae/kMq9LD3FP7jZCUsqDADfMGGaBzC7PsPhd
 1Fw9pW1soZLzEg+hQDhnFDJmObRYHfSIsWA1Ww2IO2Zr6Ut4oaAvDF0XItJNFHm3E3GY
 5yFF1Cvic4/BuIyYswg+QUOMXCZSXg2LSpvxvMxNx3QXbO64wFHDM1VJYov6d8KCCuje
 nJTw==
X-Gm-Message-State: AHQUAuYo29vdcFLjh3gz9Ns3GCNCZksdKaj1rxk8svLZ/SJa19e3DiFo
 VTWpQxqEGQYSGdvHKCcjncV5Rw==
X-Google-Smtp-Source: AHgI3IYIGdh3BMoAdBQc9yIIBqxGfEpuiJ90YRvsMcgkZq9oNtb8MHdKWODVesMCyVYe4AR47RtzgA==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr27589924wrs.94.1550771212544; 
 Thu, 21 Feb 2019 09:46:52 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id t18sm13749086wmt.8.2019.02.21.09.46.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 21 Feb 2019 09:46:51 -0800 (PST)
Message-ID: <d7de65c614ee788152300f6d3799fd537b438496.camel@baylibre.com>
Subject: Re: stmmac / meson8b-dwmac
From: Jerome Brunet <jbrunet@baylibre.com>
To: Simon Huelck <simonmail@gmx.de>, Jose Abreu <jose.abreu@synopsys.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 21 Feb 2019 18:46:50 +0100
In-Reply-To: <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
 <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
 <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
 <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
 <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
 <84fb981c-75ab-ef9e-edd6-cd0c52d9dc36@synopsys.com>
 <cd344fa3-758f-3824-ddd3-568ce837c4f7@gmx.de>
 <8bae9cd6-5c44-30e3-bfe5-8d6f853f170e@synopsys.com>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
 <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
 <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
 <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_094654_305763_E174B8D8 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-02-21 at 18:27 +0100, Simon Huelck wrote:
> Hi,
> 
> 
> 
> this was changed recently, with a patch for the EEE stuff , see here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.0-rc7&id=e35e26b26e955c53e61c154ba26b9bb15da6b858

Hu, I was not aware this finally went through. Good !
As explained in the patch and by Jose, the GMAC should be using IRQ_LEVEL.

The realtek PHY has EEE enabled by default. Having this enabled generates a
lot of (Low Power) Interrupts.

Previously, when the GMAC used IRQ_EDGE. Because it is wrong, we would
eventually miss an IRQ and the interface would just die. Unfortunately, it was
not that easy find out.

2 years ago, we just noticed that disabling EEE would make the failure go
away. Forcing this EEE feature off through DT was merely a work around.

Now that the real cause of the problem is known, there is no reason to keep
this hack around.

Whether EEE adds a performance penality and why, is another topic.
As Jose pointed out, you can disable EEE at runtime, using ethtool.

Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
