Return-Path: <SRS0=mdIi=KW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A2BC47089
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 May 2021 07:32:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C1BF61186
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 May 2021 07:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C1BF61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EZ/4jgBBv0gBgnDYR7C58xUFjG8F59/n0twh2KyW6OI=; b=nXDiyKqk5YZ9KfwDiVNH5ccV4s
	WRQvQoKnoW0AJ93z8r/+ZRoAyGvr5N0H3f0uhQ2MlCeKyxYH5Q9dCN7zQlhE4xHhQQgNoa0kmON8V
	Ge34Rtck4TQy+SYdtNZtQgnhXEKRbdGcESZN2k+XLOSumVnN7g9EGIq7fo0FLf6nRYJ9xGjK5wlMT
	3ZJHaKPaeg/T2rdoXdI+GW1QCdFF8GNJ7PPers3j4M0kLc0A0QlAfzlI+21J0sKuByiFwjSn4Kihg
	xXS5W3xq7t2pyxiBjITdL2RfoR0T/na3qTWse2Qry0dgw48hE3TR3t1YjaDrY3mIHQC/KjwqloHQl
	jQ5FCs6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmAVB-003OC0-50; Thu, 27 May 2021 07:32:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmAV6-003O8m-Tn
 for linux-amlogic@lists.infradead.org; Thu, 27 May 2021 07:32:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so1942674wmf.5
 for <linux-amlogic@lists.infradead.org>; Thu, 27 May 2021 00:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6hIT+shrCAZfdHqZZ6hjkiJ3isC79KXr4S0rxqlL3CA=;
 b=eUqHjKpkwRZn0f1MjoqKQYkyge0PAD9c/YKHL5ebegaNziX3tbAPKuthZH3mYj6tdi
 baNM2DHZsxzVhn3fU4X3hPTOomUMb43HipWRgx5U/Sudk1itGLhwUqZwA6jev9EIA+x2
 cl/Uxf5Kt4XAMf4QiAz/OZY0fYAzX/IgfU1lr6DdSamP8MTZHnFrNwX8j23NsPvORIIP
 rKYfMRE4RjP5O8RCT1qw2bpZamIlfMl2lvhMA+GazcdIL7Bkjq0t/6IonfD7NA5vAHR/
 o47hl2kVUrd/2rLt18Y/l9/XHJ1Eve9TrZnNqXKIbRSZVC8xEtSv6EiCUxgAw6NtpSu+
 OS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6hIT+shrCAZfdHqZZ6hjkiJ3isC79KXr4S0rxqlL3CA=;
 b=c5xSekyU5BoHNq+3AQhW2mA8hpdMJkXVWVi/4t7/+qe3/uSBn6q7xS2eYDu9Ys0BUt
 0aXQDGSkv1GLteGQAIG/mKU/vjaQ+4o58dKUaNOqxsO1EivQDIZLEcU1Bu7Oew8TxcP0
 0P+aaJx7KfPbdut0l/iFuYYsuG3aH+web87hdnj9l97KYYMixNOZhFCDsU0kFgtF4pMl
 OQ1Lewr2Uvk/uV6csWiguMKZysIWPl8L5Z8Ak2xCXMZ0r0Nq6Rkn3c8Kc1E6g+SjwBSM
 miclu0cSzt4jzOkU8SDyM4KD+QsFOW1wvOmNIGC2Gk/ZC5W6eNPl9DvrmPgfSe8oJ8C8
 DihA==
X-Gm-Message-State: AOAM533Gkp4WPmCOLXNpJGrqiXeHBH54PvqAxg8b5FI18XRkc7GdumiH
 T4xJSTFtNJY1/oS8uG/b7OkpXw==
X-Google-Smtp-Source: ABdhPJxmiEm/MKIe6NGj6Ccektk5aNFdsBXcwU//FDin47cWI37BYbW0PquZ0o+nWUfht4f3fkAFJg==
X-Received: by 2002:a1c:9d02:: with SMTP id g2mr6682239wme.119.1622100732318; 
 Thu, 27 May 2021 00:32:12 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:f7c:28dc:fe09:27d9?
 ([2a01:e0a:90c:e290:f7c:28dc:fe09:27d9])
 by smtp.gmail.com with ESMTPSA id o11sm1817760wrq.93.2021.05.27.00.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 00:32:11 -0700 (PDT)
Subject: Re: #linux-amlogic IRC channel: move to Libera.Chat or OFTC?
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: jbrunet@baylibre.com, khilman@baylibre.com, carlo@caione.org,
 Beniamino Galvani <b.galvani@gmail.com>
References: <CAFBinCBuFzJVXFdDqpy9HgWt4AMMk_jeOWvQ-mYke2z274FXPQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <97572f8e-b5c8-4bc4-8348-a3c284bd9aa9@baylibre.com>
Date: Thu, 27 May 2021 09:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBuFzJVXFdDqpy9HgWt4AMMk_jeOWvQ-mYke2z274FXPQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_003217_078644_447065B8 
X-CRM114-Status: GOOD (  21.41  )
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

Hi Martin,

Thanks for starting this thread.

On 26/05/2021 20:25, Martin Blumenstingl wrote:
> Hello,
> 
> today the #linux-amlogic channel on Freenode was taken over by the
> Freenode network administrators: [0]
> I believe it is because the channel subject contained "Also on Libera.Chat".
> 
> Due to the recent events going on with Freenode other (large)
> communities are also leaving Freenode, for example:
> - Arch Linux: migrating to Libera.Chat
> - OpenWrt: migrating to OFTC
> - panfrost and lima drivers: migrating to OFTC
> - (many more)
> 
> So I think we have two options:
> 1. Moving to Libera.Chat
> 2. Moving to OFTC
> 3. Trying to get back our "old" channel on Freenode

I sent an email to the contact-us@freenode.net but had no answer so far, honestly I don't expect a reply.

> 
> The steps (as far as I can tell) for switching to a new network are:
> - creating #linux-amlogic on the new network (already done by Neil on
> Libera.Chat and OFTC)
> - inviting the whitequark IRC logger to the channel on the new network
> - updating the topic of the new channel to inform users that all
> messages are logged and the logs are available publicly
> - updating our wiki with the new IRC network: [1]
> 
> I am not sure which steps need to be taken to get our "old" channel on
> Freenode back.
> 
> What do you think?
> 
> Personally I vote for option #1 or #2.
> I have no strong preference on which network to choose.

Neither but it seems the most users have migrated to the Libera.Chat channel, so I'll be
in favor to switch to libera.

Let us a few days to decide again and do the switch early next week.

Neil

> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://freenode.irclog.whitequark.org/linux-amlogic/2021-05-26
> [1] http://linux-meson.com/
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
