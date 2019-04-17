Return-Path: <SRS0=RDff=ST=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9316BC282DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 14:58:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64ED0217F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 14:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hvZLrrDy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kaRdi/Bs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64ED0217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eE//otAdq+r4yNQmHDsngybtZJl9MkjoqW+Lz+KICyY=; b=hvZLrrDyT9B4Qo
	iz2P0ZKv5yWG+CG3KSFEMY2wuKLlvuTAme1xJ1NiQO7K10U9wkztls602jpJ+ZCuJzcznyG2Rgcsi
	TGLVNFMoUW0KeVyhEWdmV2KzkaIndq1EG0jqlwhivjh/0fGXPGXcEoQ/aJsCQfFMCAz0qbHxFGgif
	mGzKkkRr+6QH/3Ey0VvydXk9jMiEwTgpD5s839HBReE9P1EFJ/8Pja2C9VagleDOs5nR4lbmNbZYB
	ren34WZu4Hzgad4xEdNr0S9CQExQdE+xdDddi6twDE82ydFPYs0NpztXcF/zxINcxQeO++WhW7FO8
	zMD337xwkh3i0XKqBIzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGm1E-0007gN-Fa; Wed, 17 Apr 2019 14:58:36 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGm10-0007Sh-Bz
 for linux-amlogic@lists.infradead.org; Wed, 17 Apr 2019 14:58:23 +0000
Received: by mail-pg1-x541.google.com with SMTP id q1so12108556pgv.13
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2019 07:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hIIpO1OGr0PquEHJp7NBXCSjbjqUDnrfVggfwDKE5Ec=;
 b=kaRdi/BsoXyg7ycbecceYvj8s+gF82c7yHcGiJBFbVQBRyw/BVYSKGr6u9DvgWaxcu
 8IlRveljndKVAw0r316IK3HepHmU0EbRzOpu3Nb9jECXkj7GxOxUmmIxpVJtGdCgt/Gt
 KSOksD9atfnf2B92t4ODEooA1TnGf97rZeHs5OujITw1Zoty8fxClyOwW44ipbdwiMAj
 lSzOTE6KLiJKVaCWAL/DAyycDSV1yRMc02FRyASygbJq7c0JjIHk6Igkn/qN13m4BzOO
 tygknYJs4uIf2zaWXujevR1bry9ckrc11RJT6KY66X0Y+gPBLJh80bCR3E/vdLkOVYw0
 rQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hIIpO1OGr0PquEHJp7NBXCSjbjqUDnrfVggfwDKE5Ec=;
 b=GPTYOJFdrrHTsv2N3C/wvszfv3x/J8yRtrMZvmVuq6Jh/HJ9zVGubiTat8fGoybibB
 sT7agIvB50Fp8MqRgFjSOkGtTYrkUPl+ctCiNkiFIMQ4G9bdzbguutZmeeqpbma0nUs7
 xfLAh5QPnn9QoIooGKsrk87VX+cs6i9BQ9LaZtLST/SZNXQl6q0dHaWGRcW95v8uJs+4
 FMKSK0jj5sxiQ+Wp1mToZg57qE0lk0dBuDldueOAtf52BM8/L4JIvhj9a2lhSJY7rI+Q
 G+v1j0seE6Hx2WwucikzLt3tytFF2YD7C5ORm+9KLksTJXD6E4QhV6spC3nUEeTcEmFT
 5gAQ==
X-Gm-Message-State: APjAAAVrbWMtPTDMEjCuV0olWdeK/WZTYNHFJz0PzTPKa5l5E9uWgtwo
 LaRSgZR0ab1YP315oSbzfXFk2zYQnTM=
X-Google-Smtp-Source: APXvYqxwrjUTE3hfcE3g3k5h/5Cuuk3xuspztOmJVt9obrvqFxeUV0A7PlPWphuz1+3kkH0OAA2/vA==
X-Received: by 2002:a63:4101:: with SMTP id o1mr79426348pga.17.1555513100546; 
 Wed, 17 Apr 2019 07:58:20 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:e160:e5a1:483a:1ded])
 by smtp.googlemail.com with ESMTPSA id l4sm39616917pgh.17.2019.04.17.07.58.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Apr 2019 07:58:19 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/7] arm64: meson: g12a: add audio devices
In-Reply-To: <3eec8b122aa4912dfa67aeb37ad2c941c34c0a38.camel@baylibre.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com>
 <7h5zrdpytg.fsf@baylibre.com>
 <CAOi56cU0dHoyRzTXeKGoiFwTms4WuJ7LV2EXTJLoEmOsC8OyrA@mail.gmail.com>
 <3eec8b122aa4912dfa67aeb37ad2c941c34c0a38.camel@baylibre.com>
Date: Wed, 17 Apr 2019 07:58:19 -0700
Message-ID: <7hmukon0fo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_075822_403240_E8AE41EC 
X-CRM114-Status: GOOD (  16.99  )
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
Cc: devicetree <devicetree@vger.kernel.org>, patchwork-bot+notify@kernel.org,
 lkml <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Tue, 2019-04-16 at 12:22 -0700, Kevin Hilman wrote:
>> On Tue, Apr 16, 2019 at 11:52 AM Kevin Hilman <khilman@baylibre.com> wrote:
>> > Jerome Brunet <jbrunet@baylibre.com> writes:
>> > 
>> > > This patchset adds most the audio devices of the g12a SoCs.
>> > > 
>> > > Kevin, couple of things worth noting:
>> > >  * This patch depends of the new audio clocks binding recently applied
>> > >    by Neil [0].
>> > 
>> > Was this supposed to be part of the clk-headers dependency PR I
>> > received?  /me looks... It looks like it's applied right after the tag I
>> > pulled, so I doesn't look like it.
>> > 
>> > If I should queue $SUBJECT series up for 5.2, I'll need another stable
>> > tag.
>> 
>> Also, this doesn't apply cleanly anymore to my v5.2/dt64 branch.  When
>> the stable tag is ready, do you mind doing a rebase? (or telling me
>> what it currently applies to, and I will do the rebase.)
>
> Hi Kevin,
>
> Until we have a solution for the drive strength in pinctrl, I won't be able to
> submit the audio pins. I doubt it will happen in this cycle.
>
> Without the pins, audio won't work anyway ... so no rush
>
> If it is ok with you, I'll resend at the beginning of the next cycle. Clk and
> ASoC deps will be merged by then, so things should be more straight forward.

Works for me, thanks.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
