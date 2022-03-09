Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15708C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Mar 2022 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ovhJDTIWeo82MxeR4unm60WRtpXaArG648hQo3BMt0=; b=ZBK/M53y2kYaB2
	YT2rbE4cgISsTOKx7rz7nP51D2OxAWdeD5IeiXsnXvmvMScnDibMuSSqcOljoMLHcf9YtgtnQsvL4
	0oemGuYdP2rzF5lVPpIanXztiBvpUs9wBU8mvWYBykGhl8aP8fUVabtGQYXzjL9bd6dXANmjtnYPt
	VPkNqf/zjKwQVws8oeZAMxHNZZI2VVb1SEg55Dqhx4QZbn6Tm3m6XP/6shE6GdB2Q/ULnaCbDchf9
	A4ArtgpP9XUxbdw3GLDr7f0iJKbNHAoiNBpWOf+Z8ruz11Ou0u1cOxkmWPxi7oPJgDnrpMwxQxfAO
	kmrfjid7Jp8UFF5PiTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRxto-0096zX-Mr; Wed, 09 Mar 2022 15:06:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRxtk-0096yZ-JR
 for linux-amlogic@lists.infradead.org; Wed, 09 Mar 2022 15:06:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id e24so3479797wrc.10
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Mar 2022 07:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=moBcVO4/zcOx1GJWJOPQodSwqeyH9qKr37XAEJrs55w=;
 b=xTq9TsVY/e7a+L5/g45+gc7gQhtImlgR1X9hdvm84A4/6Vl3Iqjis+Tqk39QWte43u
 oZTwCMdaVapSCYGJf5qYGvuHqUpQtMgvPITM83Y9nY1pIe0mwT9347zp/W+vPvF57/Q5
 VK6euyNQZTLDLAIUoIxAr7yomegfvfxIUHHPVoP9iZXx1TNmvjkKMyNGhIw3RAUXgDNg
 k2JrovZm5nFVGUccwogG8+RTUnjLOZNnm31RCPDjsQ/jqkiEXNtGSz+pEZwt3LmIfPb7
 SDPybDoEBNFZ1hWJzPMx356BloxJJycPi02zw2dvk8W+lgGTPR2/We0IBcBzZD6K/MCN
 vIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=moBcVO4/zcOx1GJWJOPQodSwqeyH9qKr37XAEJrs55w=;
 b=BPBoqOEXKtDcbjv7JoJBmEWzj/zn1J3E7qDs4/P7iUXyweb5YTcSW+0bXc+N7SOwPl
 x503Cgyu0mLqleE16r2d+CGdnduKZIEMCrBmOfC5iFEP3McpPHENkEiIVfyWVjfQa5BA
 5IjwabNnNC8qnpe+V00SxNTJb/710AY0ekEPNTCnqoFLre4Kex8s87QqL1qRotmMAtQy
 A+Kj8b5NZrtwCAv+fqF0nYwyYuiLRyunjEBq+8eF2xR6hmlnqI/JJkexkrZ0cFnHqn/B
 gCOXWqkpt8REjQKXTfv/MGlYrW2eR3bpPgKSPNo5H/rXRXn3p9guV7B5DKZ+poM8rhRf
 LeyQ==
X-Gm-Message-State: AOAM5324gwSZBieTA/nAn0guhWR3rKINPeub/sYOCdQRVi+KdZhGMdDR
 dFZzuBCnmCljUw7VQ/esXh1krA==
X-Google-Smtp-Source: ABdhPJw3bLQRbTPx1PwgjgPNUkIGCdNA73k7avZT6ToJuXxNgNm6Pq2L+rTAc5AkxwLjddmhLmJn1w==
X-Received: by 2002:a05:6000:1ac5:b0:1ea:7870:d7eb with SMTP id
 i5-20020a0560001ac500b001ea7870d7ebmr45585wry.171.1646838402736; 
 Wed, 09 Mar 2022 07:06:42 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 q23-20020a1cf317000000b003815206a638sm5264634wmq.15.2022.03.09.07.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 07:06:42 -0800 (PST)
References: <CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com>
 <1jczjzt05k.fsf@starbuckisacylon.baylibre.com>
 <CAK4VdL2=1ibpzMRJ97m02AiGD7_sN++F3SCKn6MyKRZX_nhm=g@mail.gmail.com>
 <6b04d864-7642-3f0a-aac0-a3db84e541af@gmail.com>
 <CAK4VdL0gpz_55aYo6pt+8h14FHxaBmo5kNookzua9+0w+E4JcA@mail.gmail.com>
 <1e828df4-7c5d-01af-cc49-3ef9de2cf6de@gmail.com>
 <1j8rts76te.fsf@starbuckisacylon.baylibre.com>
 <a4d3fef1-d410-c029-cdff-4d90f578e2da@gmail.com>
 <CAK4VdL08sdZV7o7Bw=cutdmoCEi1NYB-yisstLqRuH7QcHOHvA@mail.gmail.com>
 <435b2a9d-c3c6-a162-331f-9f47f69be5ac@gmail.com>
 <CAK4VdL28nWstiS09MYq5nbtiL+aMbNc=Hzv5F0-VMuNKmX9R+Q@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Erico Nunes <nunes.erico@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, netdev@vger.kernel.org, "open
 list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-sunxi@lists.linux.dev
Subject: Re: net: stmmac: dwmac-meson8b: interface sometimes does not come
 up at boot
Date: Wed, 09 Mar 2022 15:57:27 +0100
In-reply-to: <CAK4VdL28nWstiS09MYq5nbtiL+aMbNc=Hzv5F0-VMuNKmX9R+Q@mail.gmail.com>
Message-ID: <1j5yonnp1a.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_070644_728456_AF8D50F7 
X-CRM114-Status: GOOD (  21.28  )
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


On Wed 09 Mar 2022 at 15:45, Erico Nunes <nunes.erico@gmail.com> wrote:

> On Sun, Mar 6, 2022 at 1:56 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> You could try the following (quick and dirty) test patch that fully mimics
>> the vendor driver as found here:
>> https://github.com/khadas/linux/blob/buildroot-aml-4.9/drivers/amlogic/ethernet/phy/amlogic.c
>>
>> First apply
>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=a502a8f04097e038c3daa16c5202a9538116d563
>> This patch is in the net tree currently and should show up in linux-next
>> beginning of the week.
>>
>> On top please apply the following (it includes the test patch your working with).
>
> I triggered test jobs with this configuration (latest mainline +
> a502a8f0409 + test patch for vendor driver behaviour), and the results
> are pretty much the same as with the previous test patch from this
> thread only.
> That is, I never got the issue with non-functional link up anymore,
> but I get the (rare) issue with link not going up.
> The reproducibility is still extremely low, in the >1% range.

Low reproducibility means the problem is still there, or at least not
understood completly.

I understand the benefit from the user standpoint.

Heiner if you are going to continue from the test patch you sent,
I would welcome some explanation with each of the changes.

We know very little about this IP and I'm not very confortable with
tweaking/aligning with AML sdk "blindly" on a driver that has otherwise
been working well so far.

Thx

>
> So at this point, I'm not sure how much more effort to invest into
> this. Given the rate is very low and the fallback is it will just
> reset the link and proceed to work, I think the situation would
> already be much better with the solution from that test patch being
> merged. If you propose that as a patch separately, I'm happy to test
> the final submitted patch again and provide feedback there. Or if
> there is another solution to try, I can try with that too.
>
> Thanks
>
>
> Erico


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
