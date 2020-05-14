Return-Path: <SRS0=83F9=64=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F02C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2020 21:43:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342FF20709
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2020 21:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CPK3nq7i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UouQgjCp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342FF20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2XoUQG5FI6tNPe2jJD6PnGQi6QkaD31ImsRZK+LS8l8=; b=CPK3nq7ibf/dGvRED63K5vEhx8
	H9/6s0587J8AYRwYqgG7BCuf5vypebKV9GCzsCqoRgEIgGpA4o9FPT4e3byLackBmRvHjP6djjKQr
	4abjVfWts39PbX9tuoXFnE1vEach0FDEUmxWTPKRfpgq5bc7Cl/ZpVKYjuFSe6bl8YQZuVfdMhV/W
	SdSQaN1hbyCHWWRaVgMWE1f7iiWyDChD58NLrrhl0k74qiYqKJih37F5lGBbnDn0ZeYtwbyDArK7E
	2QWVLtbsQi4jLdSHbSsFZC+E47ZJPNElW9PukvGq/mTd2ORdd8xHkdncohQBlL0MTWkVs2eFtrasW
	llJnT2Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZLcz-0004ct-C6; Thu, 14 May 2020 21:42:53 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZLcw-0004cN-1t
 for linux-amlogic@lists.infradead.org; Thu, 14 May 2020 21:42:52 +0000
Received: by mail-wm1-x341.google.com with SMTP id g14so15283549wme.1
 for <linux-amlogic@lists.infradead.org>; Thu, 14 May 2020 14:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=9C0MFT/ruyAtNrLPvFLiLwJ3Fz0N9PGB/WxB7SsXAkU=;
 b=UouQgjCpN1NnTUjZxoU5G3L6iHrNHHH2JS6cNnQUSuIS0+UfOkUV9cib86pdXzpWSU
 59ncLVlANysGIMf6RM6JF5RfVVPEkUaWCXJh9k16lJR2zU/I3dY9nWFFtw1YueDSlJuu
 rrax8cl9vL8wkqjUn6+C5osOUMWWz+v3XXm6v2GX7n230tLwvcbzXVD46n/0oeLnBXfh
 ddxXwqssLQwq5BCSDT6wZHpT276RebyfgwQJqDAl8vca/kwthpUhEl7HTuZa9VShH54V
 sYqcPgGwbJxBLtoIBvLHzVhWU4s6k5a/e2afbcXqsI7pMD80HyhC2cAcxUOQvjMbSWPG
 eyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=9C0MFT/ruyAtNrLPvFLiLwJ3Fz0N9PGB/WxB7SsXAkU=;
 b=MYwJisxqisJnzchV2s2+xj8sceFigDVLTcFTmGO7bayLs4hz4+NXTnBGC4daITUDyX
 UcgBzxdSxoXGSadP9+nicL+3xmMV8jlGSdknjjlEPF5RIvJa8HFPJrrOrYjIk8WhVMFc
 xzz9jpTadfxmQjD8jiemP3O0oysS3eK5JKBKO96w0F9S1EZvwExvRpFVKhoXLtM0zUcN
 lUjdOOjEX+EZVI/YN7X2L4vgnODrvXZiEtwMOPb0gxsB7sbyHXru/OTrYZeWLZ+gkVnQ
 RvcCZplQvXi2YHC4Zqv03f7t+KsINXZrXXZjhaTSNGflms/jzdUhyD3D9iQXXKKFJ4Pp
 8YDQ==
X-Gm-Message-State: AOAM532UE77EzybMRtXlQaQfZN134IORx60ichQpgtAf4nBhcWGT96c5
 DwlS8mepFBB1AljSVqP4bQaCNw==
X-Google-Smtp-Source: ABdhPJwdCkUKzA9R3G0NNruLW4p3wqLpiUlD1XrUneAIYgvoRrqgITtq8VK+tOgf8cffFTm9AnC8Jg==
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr366429wmd.95.1589492568016; 
 Thu, 14 May 2020 14:42:48 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id s11sm587301wms.5.2020.05.14.14.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 14:42:47 -0700 (PDT)
References: <1j3686g6r6.fsf@starbuckisacylon.baylibre.com>
 <158948975864.215346.6720030658125416749@swboyd.mtv.corp.google.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: updates for v5.8
In-reply-to: <158948975864.215346.6720030658125416749@swboyd.mtv.corp.google.com>
Date: Thu, 14 May 2020 23:42:46 +0200
Message-ID: <1jy2pudwh5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_144250_147294_65FC2272 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 14 May 2020 at 22:55, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2020-05-11 02:28:45)
>> Hi Stephen,
>> 
>> Here are the amlogic clock updates for v5.8.
>> Nothing fancy, please pull.
>> 
>> Cheers
>> 
>> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
>> 
>>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>> 
>> are available in the Git repository at:
>> 
>>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.8-1
>> 
>> for you to fetch changes up to a29ae8600d50ece1856b062a39ed296b8b952259:
>> 
>>   clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers (2020-05-02 01:53:32 +0200)
>> 
>> ----------------------------------------------------------------
>> Amlogic clock updates for v5.8:
>> 
>> * Meson8b: Updates and fixup HDMI and video clocks
>> * Meson8b: Fixup reset polarity
>> * Meson gx and g12: fix GPU glitch free mux switch
>> 
>> ----------------------------------------------------------------
>
> Should also mention that sparse on arm64 complains about 
>
> drivers/clk/meson/g12a.c:5074:43: warning: invalid access past the end of 'g12b_hw_onecell_data' (1472 8)
>
> but I have no idea if that's a real problem. Maybe my sparse build is
> bad?

This is weird. IIUC, it complains about

> xtal = clk_hw_get_parent_by_index(hws[CLKID_CPU_CLK_DYN1_SEL], 0);

CLKID_CPU_CLK_DYN1_SEL id is 183
and we make sure that the table is always NR_CLKS long. In the g12a case
it's 262.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
