Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C894C624C6
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2026 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONM1bAZN/dRDxn0HHO9lgtK7FQpcBLa0MGxuvhQDBoE=; b=tfYCsXIDnJn0/V
	vwLhnQozSDWwtgwekJBX+90mbG3o0EpCTNZet6nDuD+vUjifwiOdY7upAt73NTJ+MZsTg+KvIXaWA
	geVd3ALYhgnol2KQLcXONo9S8NHrkmjoXwBTv6URNbmLQ5vv/ZER7zSt82UPFXepkD5PvCJ5mgB77
	GxWB3QmCJrMM3IKYWzSlQqRxYUkXtWnz1d+bhsCXBvqU8CH0icSZTfW3BWCEXkk5TrE4djrj3f8IW
	RRWNraJYKrff5DdXVxHc4Ru6QRAdu8rKFdZV69wcJ+XUJ1rj5qCvlopNe+UWo+OlLImtwJhzDW7ug
	IjOTqJpSZ4pEhqwo3P5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11NB-00000009K4K-0Iq7;
	Mon, 31 Aug 2026 12:44:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11N8-00000009K37-3Jih
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Aug 2026 12:44:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49557167508so36267235e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Aug 2026 05:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788180261; x=1788785061; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EvpzgjhvcxWJzAemqIAhsf9SNmX9ng1FkRl8Qno2LU=;
        b=LTbzYnHjJeR+EItGdLFh1wwUTzE4kD7ICotgdMiRtS0jwDKN9wY0wNEisXjQZU8Nyf
         CttKs2rvjNp+TRbxLhrl+ZKfSpy40t/XlXczjYXEv0NNxe8GFYtLK/lFUeg0hN0pAKMM
         sKORCtfUdVee4xagwfeNvcFOrQ0vTvymIRF5cS6rmAWI7ageO8vpbi7FEEoji7yZeDJf
         ciZZO4/L8Mb8TwG3utXpk+fXl10syoo1UsLhUi8ZK6tf+IXO9TN07ETaKtk7Ngi+XXqI
         ciqoAfmsvSCHRmQfWNmg+do44Db9aWf6mye83VS1eqzafxy1w8KM3HmWk3s00Sl3hok7
         vffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180261; x=1788785061;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EvpzgjhvcxWJzAemqIAhsf9SNmX9ng1FkRl8Qno2LU=;
        b=VyjzvCnPLMZD6vOAaNo5ik6nIyxWCH48O7mZ7ulwPqS1ip9+U+zICPYUg9yeuDUNdi
         mY8wckFuF0lhP7qvxCzD/oY70x27Xh4IZ9Dw/Jwslbnv7GNkDwl9nTnQYTcfMEhx4oWF
         PZj7PnHGWe6hsF2p8h3Hn7x0BcHq+2in2BegRTSFNVrrMPCWOhgA8LS2kE6AX36BNtvN
         is1ksYUEPIvrZJo9BxGXAQyAPHTtiKV8M0TaWCSaHUp4WP8DlR+qM3f2BzmhpM40XFuy
         2UAxs6aAMz6enE1enUyVd4G9QgCylMVedPFSea5meQdGxlWoLEc5c+aW+GnA+wSFjoe1
         v3eg==
X-Forwarded-Encrypted: i=1; AHgh+RoHhwCiSG1PprWrPDYr6cqe1wtkaZlIEyuVqCtTIIoSdeaTJKpcn7zzCpAJFJGJAX3XqvCOL3LRNicHl3mN@lists.infradead.org
X-Gm-Message-State: AFuF++n/VXT9g0aZvkWhJ5DbCByautD7ZbpzLlHp9PO/bugWKGoNmfTK
	UhwyPMxjQi60RprqVJQAL8qk+AZHMQpMts1WnSyh1pgFRCjPO+5iDGS738JRqhzmNaI=
X-Gm-Gg: AR+sD1309nUSXnk7LinPQ3A3Z/aqKl4RsFiBSfj3eWW/a25HgaXy4tLCyedHyTh3nGn
	m3AgAZXdSmtRbx3O0Tp/MBQdCcTnBofg+VFVhyxX4xNmRZTPsWxxYpHMvRJKfmJ9RUajY7hNXvF
	nBwpcyenipedxbu1xJL5cjg1+x7j5rlya3pffPuG8pr9g4Hsepv1d2nt7M+LYcBa5gYRXk2E9Ac
	avv16C9tq6IQUKQ4y4dXv57j1+VQ37lMxPMJVLwxMVSVuY9l+sVXBFWPpxhKsSEZWIecLEOmFR7
	j0ekE1M5Yw0mpb7q5iO8u46gdqSdJ73YX7BF+uz0GP+K/YSqc3Igl71mp7it7pJrlxlNTD1/uSl
	RK0PND4LmrA44fx4lDIRq2C36mK9C+0WAJpxU3ir9RQDraasG4cnv1jvw7qV7Wmb6asPFeOmznh
	0pTJnCSbFeLDw6GDTzmGr9o4poHUc5cexN/f4h0EZHlY6JFHtKnDr+o2au6gOVenWQ433gmZSLe
	F8ddd23Hw==
X-Received: by 2002:a05:600c:1f8b:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-49cdc3df92amr7182765e9.0.1788180260838;
        Mon, 31 Aug 2026 05:44:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm390196485e9.12.2026.08.31.05.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:44:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260823115335.102219-1-tanure@linux.com>
References: <20260823115335.102219-1-tanure@linux.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: amlogic: t7: fix UART clock and SD
 card recovery
Message-Id: <178818025763.2318126.6483446574954996795.b4-ty@b4>
Date: Mon, 31 Aug 2026 14:44:17 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_054422_868826_574DB844 
X-CRM114-Status: GOOD (  14.06  )
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

On Sun, 23 Aug 2026 12:53:33 +0100, Lucas Tanure wrote:
> Two fixes found while booting mainline on a Khadas VIM4.
> 
> The first one wires uart_a to the real UART bus clock. It was pointed at
> the 24MHz crystal as a placeholder, because the T7 clock controller
> driver did not exist when these boards were added. That leaves the real
> clock without a user, so the kernel turns it off when it disables unused
> clocks at the end of boot, and the board hangs with the console gone.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/fixes)

[1/2] arm64: dts: amlogic: t7: use the real UART pclk
      https://git.kernel.org/amlogic/c/882de800bf583dd15969836088789edbf035a944
[2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
      https://git.kernel.org/amlogic/c/c793a084ab3088744516aef437b4239d0d98623f

These changes has been applied on the intermediate git tree [1].

The v7.3/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
