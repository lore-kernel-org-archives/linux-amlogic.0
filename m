Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C022D29DE0
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 08:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NXC1qpfZmSwLQGSWhrzpARR4/FmjOxUWqP8jzup6eU=; b=10r8+Vlw3pdLWy
	rtenwKOiH8gltb0Pp3OnyIrvttBEC5NfdDeKSbuRKYquC3HJ08+CAw8EyHu59pE0M0t9kIgglSmGt
	ZqohcDUJ3gbHXW2Ib8M08JYHukB51zQ1Z/DfTWF77ABCwrD22U+LX/gB/L8vyLnP0/m3OkubL1gkP
	jv4foBBf+Si3Ol3A292vVuojWq7hDw+HIiR8GkJFqVSavwtyPo6EMfj2tk76SITdX5j+0cO8WZ/IO
	GBU0oyiUnsxPz8YFqIepHtAY0pq6NnFyOWv+EYjBpeeKKz8fJAUDx5yFuo/iXo9BoPiwroZ5Yoxlv
	uxjGeRzjFU0zYDf9Jj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZLM-00000006hH7-09QJ;
	Tue, 13 Jan 2026 08:01:36 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZL7-00000006hEv-3ccF
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 08:01:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4327778df7fso4531800f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 00:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768291280; x=1768896080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5MnEb6E01UjiCSwvv6dgm9BmEt7uX+GvbMRSazEiEo=;
        b=UR08slaHtu6EAW3KouQ4S6YbjcE6/EuebDNteN1lnvq4kXt013NfxLAbRL1Ix1nFsj
         rmd9gPw0ciGePDecEUJJ0r5xtfydl+m9WtnEzJQNjeMN4fEkmgbrtcgUDpjddhwqwuLS
         d6jhdyKKkrSMfDpuNtVK0bCMM+vo1jGySfcdpSeEApqWPsHLLiUQYoAhRnW09gPyolq5
         OcYN1kragmCxdQoyElTP0RW2N+JO7zz9ehQoTs7RQiTD+cl2bZC3B0rBB5ijj2a1ExLM
         6R7JAMAoVVYBr8cVSCaMcb72+seU8QVgB6ykYR96PnUuORG6Agm1P8/brj/ZrE/LIHuA
         ZsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291280; x=1768896080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5MnEb6E01UjiCSwvv6dgm9BmEt7uX+GvbMRSazEiEo=;
        b=ZhMmsoCPNGFp8MFjs6ErAqpzEQVonp8Yqk2zwVLNORe5JLKgI1WIHWZtTjlLLQwL7l
         OTBV0hWK+XgMmx/PmMZezoNAKSgTq5THym+nptekomVxyJnaVijfVO3TEbt7/DJ2g9hr
         vb5mrrrYbfQhINeRVla11YPluyDMY9qAZqOeQ3gIvmzZ2Vwgj3ryrYhFUHvOwKrdwIaQ
         0wL5eo+4ceHXZ/dG0VZDqvZeEBD+48O1HE1msFBE/KJDP/CuxqXqPkEXiKdu+/5qOfD6
         a7ZeHk3n6rNVo21pzLhL4w+S9reazillyW7wlGv9ZpxDEamE3R9G+jqDHnVprqldF8ml
         uMUA==
X-Forwarded-Encrypted: i=1; AJvYcCV9rYNpW2/TB70WrvdRUFn/FT3uIpnY/u8sn9WH4+N7lTsB3AconvcZdd1bM2hS16zhGbaB/gze9YjTeBIq@lists.infradead.org
X-Gm-Message-State: AOJu0YydVzGkFCzH02FCobhSiYY8+LEa4gkyhmI6Gx2IGdj8jtTB5eEA
	6TLLHax1M31MHHKOyk768QjHtjD/TPzyE+TZ9QQu4Jztk46gY1mRaVB5lid7wz7Nghg=
X-Gm-Gg: AY/fxX5iJc0Z1xzNDLPKrGhH6JlFyn8pgYp8xr9mg7QiHaxttvioUZ516t8R5aAcgvq
	39vhHMs9rgKLe6TuB5V8o83WN2yjAlzdnbwZLUmqUEHBCmbACR0uwVAqvlSxCj3yTFwIO6hLL5+
	PHvNXfDKVTdvQrP3No6J5IUkGcuaWJU0mmB2ixi06U7FTO8VY3KkQeUgJYgTLA3sI5UcF7LgWlC
	wJr8y84ggAii1/0yqw5ruMWuqX6ckuS4CFFwExSBHow92XjNXuOZWsk9cyednr3G0hmT/4Z4uVg
	PsWZY3lm1G+rj/xLyq5Dm1qpDfIuHlExBuGtzAFEXAqYymXjsM9kJgSzYsoXWylPP/DfiMY4vsE
	M7zBQd5p1ouvNrw/eLchYDG6ZRC2NuijwuHEuIW4hI3eEe2xBVyzIy+n7QriFNGITbGMKWo3t+5
	zskENHWIRIQkEtntC8zIU=
X-Google-Smtp-Source: AGHT+IGHLs8CVfsENLu/dr7C4nqib/pKnwfhtjt984l0Huar4cDZxsByF4l3i43Kb2BNmKNHxXR6bg==
X-Received: by 2002:a05:6000:1842:b0:42f:b65c:1e4f with SMTP id ffacd0b85a97d-432c3633fb7mr24584880f8f.17.1768291279770;
        Tue, 13 Jan 2026 00:01:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::e97c:97dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d286cdecsm29024032f8f.7.2026.01.13.00.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:01:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nick Xie <xieqinick@gmail.com>
Cc: nick@khadas.com
In-Reply-To: <20260113012527.40725-1-nick@khadas.com>
References: <20260113012527.40725-1-nick@khadas.com>
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: add new SoC id for
 S905Y4
Message-Id: <176829127917.3573380.8250706225560973295.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 09:01:19 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_000122_312961_304CFC21 
X-CRM114-Status: UNSURE (   8.82  )
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

Hi,

On Tue, 13 Jan 2026 09:25:27 +0800, Nick Xie wrote:
> Add new definition for Amlogic S4 S905Y4.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/drivers)

[1/1] soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4
      https://git.kernel.org/amlogic/c/31fce0d2b13e6a4a12c9ba016e961418f8c82e34

These changes has been applied on the intermediate git tree [1].

The v6.20/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
