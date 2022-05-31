Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D71FC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 May 2022 20:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RWBSqXLqfDrRT28p8OHsUIF74oUBYs48U0BKnZXTHw=; b=Y+WuSIUxv6sE+z
	GHbTz+Jjpi9powa7moQaI/0dU5ZAXcF3clmvl6M9hL3pnlSxY4IswBy4vpsvo2qRsw5ifgUPYNQI6
	YHk21GzHK3t/O5/58QuauaiXe/8TslEi8huOZuQ5oxFSDOAWXHkgB/3iFRTkPUFAGhYBCuFbnZYo6
	5vIagJjJN1WssKkA2sn+CrzbZT5+CY9F5x3zykoSggiH0lrm5L/8yM7jsHfZAgFqmVOtCnEj/+ZES
	BMN2LEWyJl8HrjboGnSXPxRu0Zs3lPIrMyQJJdoAvs7cl9B2wOOSgSg8fEGy1qhpc+9QREN6XJhDP
	k8f3cI0FlVFRlACeMGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw82N-00CPQ0-IE; Tue, 31 May 2022 20:00:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw82K-00CPOW-Ty; Tue, 31 May 2022 20:00:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id a15so3944098lfb.9;
        Tue, 31 May 2022 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N/5hFp0lMWC4dYsgyS8F7d3AZ1PIyvtWlhq+Sm07wFE=;
        b=BfAzztMNm1Jp/TdVi0t4iVReEv4ID5XLse+uh2O08vd5p45IIiN2ru9VwuJU6Um5Nv
         0qh6aXb3IQyqKe5AJz5SZ3TUw59Bs/A9IZpkkj26xiglqeckNDZL6KrBNR2L9m0gzOW9
         xN8FWpowprhXG7MbtRfuG5IEYYtXp1UOcQ2cjuare7jC91K6A1IVfw9NE4TttMwgjjjN
         mkiznqExdK01IwGOBpobCBk5lXWvmApbyMdx+Zp6iOQuLn696fC3m+i1EsKvqenaRQXY
         jia0fUobMIA/yV+n357zIRHHq3K9HD5P47G3l49XAHkYdD/+A/ITVdWhi2yroIFq60s2
         mgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N/5hFp0lMWC4dYsgyS8F7d3AZ1PIyvtWlhq+Sm07wFE=;
        b=PFtT0Veh9tJ7V2rWEjUXAGtE0pbi89qXiUJ2OONAI1dGAkCm1yF2P3zFoGrm+fRmNM
         nT5IrvlWtlrlTjzbleaKzfAf2tSuAvhqAOWAgzBSKp+bjy1SI8k/N10JM6O5JWDYan3w
         vgSXQVSUht0rBOQmU9oB5LZzIOLOs2/jflZM6+R5nFEdBEqfkpKyJL3PnN4yX64ivJ9A
         lD53BqOQgmW0lzG8sDhxsGRClOTC4G4rJk9JljIZYNrTCKPAXN8WJhqL4QVd5sH29BKX
         zNp/hydipVsNILBsZsN7lg0I1RoYrBUQh3k1SUoZexVuVD5PWce49AtLjcnAz0KFefmW
         2leQ==
X-Gm-Message-State: AOAM531Rgjmu+ogX8hq+LiGIm9kd2jkI5lM19FDs2uqy4kpqA1z6MSLP
	oLp4kW7F7O1zPg4PfB3fqvjIirVMM9YmBTjXeh/vRzCw4iw=
X-Google-Smtp-Source: ABdhPJy10QXI2/ZkHtl9TZrO9ctuZkG39qUaTuGRRuWnMdaywHiIXFoOLxMbU2TIJIGuNyp5YTDWSwDcDQgsRT5WYgM=
X-Received: by 2002:a17:907:381:b0:6fe:9ca8:c4b4 with SMTP id
 ss1-20020a170907038100b006fe9ca8c4b4mr52565612ejb.147.1654027203570; Tue, 31
 May 2022 13:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220531144818.26943-1-linmq006@gmail.com>
In-Reply-To: <20220531144818.26943-1-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 May 2022 21:59:52 +0200
Message-ID: <CAFBinCDrnUXS+djchc=68jPVZwqbgPcJy6WKFus7L3JKTSsdZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_130017_024054_AD341A29 
X-CRM114-Status: UNSURE (   9.66  )
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

On Tue, May 31, 2022 at 4:49 PM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_graph_get_remote_node() returns remote device nodepointer with
> refcount incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 318ba02cd8a8 ("drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
