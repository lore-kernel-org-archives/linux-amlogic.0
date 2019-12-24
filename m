Return-Path: <SRS0=kiAd=2O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260C3C2D0CF
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 11:29:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECBE220706
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 11:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kr9vFdLZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sIrcJv4T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECBE220706
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3le+0QdBbxQeIx8kT7xLzotueIHcnZkGd3HZPkjz7Q=; b=kr9vFdLZv6iif/
	OXMvdINBWj/jPyMa6w4puCxLSm+/B2usR1jwX5ssWQjbadKeY+BwJm+9uBbXkN0gGJqEHZRBtOy4z
	I39luestLJtPrq2DIDIdy3XR31OoPbDo/0DH25uy06teZSXukQb+Q3pjakoLmQg0jBUsBF5Gjemxs
	g/b8CBgor/2kn75Ft7E6nC97nJHPAGCiUEwrSl8SvAPU23GERdnSh+DMmmldKPa4G1L4PyzDkbrLU
	I/6A5TVmURven1+Ay7Nlc6+hYEzZdJuLAMnxgeTTuxS7nveN0+xPHkvsKlEafTvNK495UdEBYbpI9
	b6/ns6qHuMawwDAkddoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijiMz-0001re-8t; Tue, 24 Dec 2019 11:28:57 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijiMv-0001qi-UX; Tue, 24 Dec 2019 11:28:55 +0000
Received: by mail-ed1-x541.google.com with SMTP id m8so17700762edi.13;
 Tue, 24 Dec 2019 03:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yaa4+iEZ46im79+sodnyaIwi0xim0AIqzXbOWPR6HKg=;
 b=sIrcJv4TUYAe5BHQg2t71AAnx6Nx94wYr993rP4u32UoTOgjy3LEDQ3fDxVI+G7AHK
 q+sWW3GX1SAXlPCCrPXm+Ws7/5w6Bd2hhYhLv5JGLqnOj6hcUij5REcUN7+DSPz8Pp5t
 Yhv5GTY5XZzc4Mr9gNU4jpakCj1sn9ItanhF0MU43kVy+hd0g8wpaFGq9kZSQ4EvzfeU
 Wf0meWFnOAL2fyNrs4I4u9OyAmncTZvIIfMzDlSsFfrG0YwsvX4mEdIlQQDcKqk4STgI
 QLYaGp6Dtm0ekk3Y2seHZbvCuLFJyZKaGXwGK3SZCpwHzwzoRNU1bZ0jeCvdseMJ9zHJ
 9VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yaa4+iEZ46im79+sodnyaIwi0xim0AIqzXbOWPR6HKg=;
 b=Yj63CJfMeyQvjpmuNSKOnG1TxGdMvE4xPRAyxOz7KwJwAmdAvNhglYRY1Hn0lsxLzJ
 J73au+/o4n/JpLSidUOGbHeTaKE0RXX63zGu1jvymoiMmxowXICltevekS7FAcOBujRQ
 rMGsfz9b0R6cOEXyYN+15m9B7YjaAR1lkMkAkRY62xnr7Kptd4zy5S3jlFM0orgXgSfi
 XrUyvMMNc+LM5PDO6cgoRNNS0obz5FDBjWVJMNFHcEWp/7Tna6qY7uRdxefRjATmJjy4
 NtnU7pvrBfDdsEYInwW+JThDDssYrVhTkJfpgbkPNbQSKxXkvo0fS+itkjZEO7PoC79w
 Biuw==
X-Gm-Message-State: APjAAAX4T+dHPubE7T7WyrLVqeXFGvitPSbWkLIKhASwTfk2ga15RjjO
 xjIhwWsOXBPB7aEKGFGZGdFM2i6a8lG6RCZ/q6ql6E26
X-Google-Smtp-Source: APXvYqz4kTKGwv6SPDwKOT61Zb8NcQu1uqXgs9fWzT9X8E/7hDxnWyW00OC7RSCNm35l0R9eR3N23za84e9iE4u9E04=
X-Received: by 2002:a17:906:260b:: with SMTP id
 h11mr37038328ejc.327.1577186932440; 
 Tue, 24 Dec 2019 03:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
 <20191216154803.GA3921@kevin>
In-Reply-To: <20191216154803.GA3921@kevin>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Dec 2019 12:28:41 +0100
Message-ID: <CAFBinCCDmCHQW+nBHzsodz0R=GKoqv1EEzB=UY=ypFs4Q6MFmQ@mail.gmail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_032854_009171_A9996C18 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, lima@lists.freedesktop.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org, yuq825@gmail.com,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Alyssa,

On Mon, Dec 16, 2019 at 4:48 PM Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
>
> If so much code is being duplicated over, I'm wondering if it makes
> sense for us to move some of the common devfreq code to core DRM
> helpers?
if you have any recommendation where to put it then please let me know
(I am not familiar with the DRM subsystem at all)

my initial idea was that the devfreq logic needs the same information
that the scheduler needs (whether we're submitting something to be
executed, there was a timeout, ...).
however, looking at drivers/gpu/drm/scheduler/ this seems pretty
stand-alone so I'm not sure it should go there
also the Mali-4x0 GPUs have some "PMU" which *may* be used instead of
polling the statistics internally
so this is where I realize that with my current knowledge I don't know
enough about lima, panfrost, DRM or the devfreq subsystem to get a
good idea where to put the code.


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
