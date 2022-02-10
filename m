Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27557C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 01:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpN7wfouQNsrSLSEw2S3Sp46G04hDj8Qpl8wEUphWdE=; b=QHenYAxSiYkEgJ
	hWnX4/2VGqQCxcuIUhNuko+NsEOwEQknyoFnga4uKCp1Y2wA6ehG6CybicfyPbtQCNzC4Droy3Xl4
	AWTGANoYVbPAf7ADK61g68QTPFocJ8GixZE1IuLy6AhSDteVt9KTfyYHFdgUo+doVtv5hZsgFwafX
	cwfFvnrxMfiWM4/x3f+/w5sGavY6Rs533E4NZWyimtOUiW5R6zqys9/2gkpY29rLZEhhcdo1DHoYC
	jjW0gbxZhA5M8xUDcIU5lwNatD3oRn8hJHKxUSxdjc3ioRX5djxFYJQ2qpO+rUOXXB0P9NhM5jfVZ
	qcsn8ozMkOdUqSwfYRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHyIv-002CLu-Jo; Thu, 10 Feb 2022 01:31:25 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHyIj-002CK1-7t
 for linux-amlogic@lists.infradead.org; Thu, 10 Feb 2022 01:31:14 +0000
Received: by mail-pf1-x42e.google.com with SMTP id x15so5076149pfr.5
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Feb 2022 17:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JNuH55wTGRw2CNKCDmZpYRQ9FVq8mQbAJA/99Xvogog=;
 b=JGXX4ykemXQNdoTLEmz0NjLVOPq9hzvUeU/SBBNHvgfOoFfHFc+2JBBtgYlb7ih2AS
 4MxIlGUzOmnpldQOxuuouEQV+inZjrhMPm+YefMjebVbO/PY3af/iTvmMncFcZuOFISu
 FFa+lu4cPaKNs2fi1PSTSDYSYrdm1lrFYDct028sneLCxdWMIfE7kAbEgFWpT5AEgozl
 pUQCwY93U2MpLvHdWRj2aPQXvvtkquNep2RlBKFeZ1DzwQ0flb5w1lAYxHLwUay1Kaeo
 rz7lqe+ip3zF8wlv5YskSHt21q070KJfLHKsI+uEzYZ5Pfeaa946MbWyVvpkbcwPj0Lh
 9UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JNuH55wTGRw2CNKCDmZpYRQ9FVq8mQbAJA/99Xvogog=;
 b=K751/fHOQO0pqLzhL+v08pbI7ZJGuuRA6KdEV6HDzgnCR2ZVQZFTYFovyyCpIt6zbi
 lhyFectdhhoP0FMpspmssTgDy0EWBBjiN/m0ekSb992QxsSMMXiMQJXLIPLu0kn1lb67
 UVYz4Ede45ox8UQxzrQ9YojPHf39+/+L8gQBrNIdj+xKbg1fxvIv9BKVzeUQRI2BfLZv
 mR0/E8QgrE1VhBf9UBDOMc6KIUu+tPmL7bNaDvsjdVJluWi+OxRtIcyughyC3OwpZMwQ
 q+0DuqqMPbfVOnazeGshyzb4KVB+49G1bxYRAGYR9gmva1tKmn+R6X2uBXapi3LaX6xD
 KWSA==
X-Gm-Message-State: AOAM532HMGMtlrTQLYut536VQpIFGB6I88QCTEplu3gqb93SECH//EIN
 +PZkFm34JKBzEceSKNMjcNZlvOg3MlOGJQ==
X-Google-Smtp-Source: ABdhPJz8Wt+8lcJKZREuw8154zIwS0J+JbpHaY9co37OSVxEQFfth+/1EIUNNtqtIRoSxcqsPjQ3uA==
X-Received: by 2002:a05:6a00:1a52:: with SMTP id
 h18mr5152362pfv.72.1644456672247; 
 Wed, 09 Feb 2022 17:31:12 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id lr8sm58982pjb.11.2022.02.09.17.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 17:31:11 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Neil Armstrong
 <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: remove CPU opps below 1GHz for G12B/SM1
In-Reply-To: <20220209135535.29547-1-christianshewitt@gmail.com>
References: <20220209135535.29547-1-christianshewitt@gmail.com>
Date: Wed, 09 Feb 2022 17:31:11 -0800
Message-ID: <7h7da3o6cg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_173113_376220_2A117E69 
X-CRM114-Status: UNSURE (   9.05  )
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

Christian Hewitt <christianshewitt@gmail.com> writes:

> Amlogic G12B and SM1 devices experience CPU stalls and random board
> wedges when the system idles and CPU cores clock down to lower opp
> points. Recent vendor kernels include a change to remove 100-250MHz
> (with no explanation) [0] but other downstream sources also remove
> the 500/667MHz points (also with no explanation). Unless 100-667Mhz
> opps are removed or the CPU governor forced to performance, stalls
> are observed, so let's remove them an improve stability/uptime.

Just curious: what CPUfreq governor do you use by default for the
LibreELEC kernel?

Your patch greatly improves the stability I'm seeing, but doesn't quite
elimitate it.

I'm testing suspend/resume in a loop on VIM3, and with schedutil
(default) or ondemand, it eventually hangs.  With either powersave or
performance it's stable.  

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
