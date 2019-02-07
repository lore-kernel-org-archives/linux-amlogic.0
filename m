Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDCAC282C2
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:11:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E161217F9
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:11:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EpgUPiVQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yKf2QFWQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E161217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33ihZYetDbuii8TVK2gztVgkdyqYbZ5fQUU/K4LYHt0=; b=EpgUPiVQc66GYX
	ukPTgDq20hwqNro5A+VTaGSlJ9PFb1ANX6cRsPgAapHGJqutX/F2vfTtSeE9X2h4XUshYCCOHl1SZ
	Vf/3Mou/IKHqdPC6K861gjrQJ9/yby3ZLx+nMfG8h8hG6k0SvFPyG3IgL1Z+Ym3g51msLpdQxDOSU
	HXo7cBbEUUHmjT78djDeV92TBQXR++gWjUGFwLcA8JQRX8jVRBRXfoo496SERjr03LLGsiTHzgqFo
	cGzbDwJTKLRagJCqsi6FnZ44NvjYkg3Z1lmQvE3+c8aQeKD5cWog3nxCyexT+/4DWvI4bIVdLFRyz
	5gdKeRz5wr9YI++gTFfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gra65-0005FP-Pp; Thu, 07 Feb 2019 03:11:29 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gra62-0005Ex-1y
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 03:11:27 +0000
Received: by mail-pg1-x542.google.com with SMTP id z10so3870658pgp.7
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Feb 2019 19:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=F/+7rRTfbZwfbHmaF3iZzoY6bHWWxxmy6iraekkllWc=;
 b=yKf2QFWQ9kNL+f5kHd3S7Jbm+JZ9GNbbas2UNL8rUF4HW2i/yx/ZHK5uAXAmxASN36
 8M2vN5z7rG85IIAtaGes9APh2VE1TQ1jZbcaEDO8ENkpjR4ATsT3+NVMNWTAQuQgoCjr
 pwbJwNKzZO+XLeKuq9apJxuW0+Lxp8RksBYKcSF/zE73ZX4rC9TD7sttRylR66Wt8tVW
 ACe+KcKZkbc8UtsTqxSbmaqha/yXUDvFI0Nn9K9x02ritem9O+DdAF8OBg7hFHJn8s33
 HiYefKiXf44FQNkLS3YIo0/EbxXOuBCc1N1SirBV6hYlwkKW6DBpBASldez4Y3StqVpq
 J9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=F/+7rRTfbZwfbHmaF3iZzoY6bHWWxxmy6iraekkllWc=;
 b=YRC9BUK29fsX2mAc+HusNsJzfnZSC1vC4Xe5QNbCUbkhmgxa2n1b8CXeD9t8vPixB+
 5lycPrqr+Wd1AeWrt5ur3W+ygeNp0xb6rqV8/olZRyTDkKiLlwrh6SaTBjgAE23Vk2Jl
 U7PDyphv3UhI6MFEvWbw3WmOGi3fZURI6pWMeDmIk8yPgCsMi9l1TXqwKSCMq5g6eHkl
 GJy99eWXm3CKrbG+heoF/RAKGHRzlY5qRLotEkkLxJIpRPmEm/bxUdrRPoOv1gYS2JqX
 ag6NvXdsqJqJmf9aqFhgf75FS6uGUWNNiiYPFqEeBejqhFuD+g8rvL3att7jxp1KGxiw
 FeEw==
X-Gm-Message-State: AHQUAuZwF+39D41/MaW27EvctS9OsuvwRKTx5Zgwcyat2X6yP6W5Yag9
 l6RFw1JJIr2VFKi23+Ny/0ZEsA==
X-Google-Smtp-Source: AHgI3Ibo9yDr6Lr5sHfOOmyOps09J7HfOK77FkIyrpu/ogCE2IHiZ3zhz9WvNtI/TAcJcu+1aQb+Sg==
X-Received: by 2002:a63:2ccb:: with SMTP id
 s194mr12774860pgs.214.1549509085280; 
 Wed, 06 Feb 2019 19:11:25 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1818:ce94:f47:7c12])
 by smtp.googlemail.com with ESMTPSA id l2sm7563903pgn.52.2019.02.06.19.11.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 19:11:24 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] pinctrl: meson: g12a fixes
In-Reply-To: <a434c3b1c55a1b5a1485adc29cfe26b45131a936.camel@baylibre.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com>
 <CACRpkdb7pje9mrgOQoiWTRxGQC8xsOvJ9a8PCguM807unPtpCg@mail.gmail.com>
 <a434c3b1c55a1b5a1485adc29cfe26b45131a936.camel@baylibre.com>
Date: Wed, 06 Feb 2019 19:11:23 -0800
Message-ID: <7h36p0i97o.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_191126_100154_0572951F 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Mon, 2019-01-21 at 14:53 +0100, Linus Walleij wrote:
>> On Thu, Jan 17, 2019 at 11:23 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> 
>> > This patchset fixes the initial pinctrl support added for th g12a SoC
>> > family, which is mainly around the register regions claimed by the
>> > driver.
>> > 
>> > Linus, would it possible for you to provide a tag with these changes to
>> > Kevin ?
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-meson-fixes
>> 
>> > ATM, we can only use the devices for which the pinmux is already set by
>> > the bootloader. Enabling the broken pinctrl driver could cause regressions
>> > in kernelCI. Having a tag, would allow us to start using pinctrl on this
>> > SoC in this cycle, w/o regression. It would be nice :)
>> 
>> When you say "this cycle" do you mean I should target fixes (v5.0-rcN)
>> or next (v5.1) with these patches?
>
> I was referring to the 5.1 release but it is a good question, I did not really
> think about 5.0.
>
> Those changes are mainly fixes, so guess it could go in the 5.0 but support
> for this SoC is still in its early stages, so either way is fine by me. 
>
> Whatever is simpler for you I guess ;)

If it's not too late, v5.0-rc is simpler for me as it means not having
to deal with this as a dependency branch/tag.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
