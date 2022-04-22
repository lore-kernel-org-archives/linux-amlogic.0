Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB445C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Apr 2022 08:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WKs0vGbkUSBVhBwh3cZGN8QDvZMfEsXeLe5fKxKIWo=; b=psWux1cIKHntTq
	4MgLfxPBnHmdT6SJ7zJVH+kjFv1xsvoo7HUuE2rlvvGIKJ9zNjgnawftB4dw85/Zf1NnoBc2JzIl/
	v+F+6EePa6ngcqPC8YmxRJ59hAB6efMtLz/IDX0zWG/JwmlAHgc2xw6YRaFLgDGyE5attOdM03tH5
	lR0eSrGET62OZCB7cZI75kfa8xP7O3CfUbZWLys1g5gf8smcHKCnVMkcz5zAsEeCmh+YvRrYKrP4g
	2E9n5vmvORZq9tcu0ZJLZGN3fsdL8kVRgdvcKOjQ79VVbr58tq+Y5LCU56L6DMqAKQfxDRWJRZG/p
	xP+NLn1o8P8WYGxvPkOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhodB-00HFOW-Jz; Fri, 22 Apr 2022 08:27:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhod7-00HFMd-Ks
 for linux-amlogic@lists.infradead.org; Fri, 22 Apr 2022 08:27:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id x18so9989253wrc.0
 for <linux-amlogic@lists.infradead.org>; Fri, 22 Apr 2022 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u7TUP/Txry1UFuyT1GMH6MxIlNWsEqUWlVQuJ3Ycgo4=;
 b=2/I5sgtu6yek/DqrCw3fNAG0CyFOv3PlhCCCJ+GXocYogXRpOANpLUGCSLIL6TXXJL
 ncM/kLDoJ/bNF7oVzLDmvTM1U3qDOvltDLOY94qFOFrVnXCkZfDsjDwyWE2jcRPo5B1P
 ttxqJ8yX7vcodL42mKjo/d0lRMIGPiXtLb17dpL2lYUuxkj6MobpP5XnR8PmKbChBY0Z
 7zmq27Ase+2MLiNJ+AreILAY0VwbdAMekeGiuF36tHqnyXwpBeV6cqPt/OeTETRnDqrU
 +QHBEU1kHUMiZEs4+Xe8l3uwd3L6Dy+ht+n9MPLNoA7z1gb/z+BsoiCI7GOSeiqizJDX
 7PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u7TUP/Txry1UFuyT1GMH6MxIlNWsEqUWlVQuJ3Ycgo4=;
 b=2gDH3UJFdOgcv3mCrOXoDZBpmV0ynZVzUW+1VbVWFI8HSGG/46bbzTcUXdh32P2NLc
 9HPCezMMoHBACW1A4M//8WO0LwKkBdUc84emuUN8LioFf30QOvwTRO9VCq9N9T2AD0GQ
 j2UP7OUJ0ddvHPPZg/AwNFzVFhgqPpPfYTb1dH0AqUbkZm64ymTdV/8hYA3Bs/hNsawC
 18OJRGztw63T0XYXhZ1gYaVyihHx9nKhmOTfPLFEghgTXGnl7tzIjWr/cVaCMqUfNkK+
 N3fY7KHuJ7jXqy60nYf68yTDKfFWbVsCRQOgMQHKo4RNpWnIuxrUkqypOxDGwX9V6so7
 7TUw==
X-Gm-Message-State: AOAM532/u2k9wgAS6sEMvpf2PZoEuusinw4UHr1km2K2d5q1TG7P7J6b
 fzuCDCPZJ+yyA9shlyCRe+rxYOseb/HGZXev
X-Google-Smtp-Source: ABdhPJwc7lC7iXT26SYx3VMbx1Xy9+zwh+M/Yt5wvRZ3xffC5nUuF/FW32z69itymsszmlEUC9PuCA==
X-Received: by 2002:adf:f2cb:0:b0:20a:77c2:3958 with SMTP id
 d11-20020adff2cb000000b0020a77c23958mr2637147wrp.589.1650616021757; 
 Fri, 22 Apr 2022 01:27:01 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49?
 ([2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm1335208wrq.97.2022.04.22.01.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 01:27:00 -0700 (PDT)
Message-ID: <b6029a92-04f0-9ae7-291c-621f9871280b@baylibre.com>
Date: Fri, 22 Apr 2022 10:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage
 formatters in trigger"
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: jbrunet@baylibre.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dmitry Shmidt <dimitrysh@google.com>
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
 <YmGSeVbwWtyHP/Tz@sirena.org.uk>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <YmGSeVbwWtyHP/Tz@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_012705_955302_970B5EBD 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Mark,

On 21/04/2022 19:20, Mark Brown wrote:
> On Thu, Apr 21, 2022 at 05:57:24PM +0200, Neil Armstrong wrote:
>> This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
>> the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68
> 
> One other thing - these should be Fixes: tags, that helps tooling figure
> out things like backports.
> 
> Also:
> 
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.

Thanks, I'll think of this for the next time.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
