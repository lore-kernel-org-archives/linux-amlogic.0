Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E103C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vKgw14BpiMlrY9nJkTB+kXhtqy3ejD3M44VxIvVMSg=; b=TTP7EX4N4KtKrK
	lxA4zwoJrMwLZvQnGVdDlHXsUWDCsfIhL75sXRCA6gACZmEwuaWHC9paG6ZlElFbsTpRt2QJtU2ch
	tHypc505pXrw3DlWgsLC31VXciiEUxZuJFqrdM3MxzUfNiI5fycPJqouczxwRhyhKjOCM2kFLUgQQ
	9oCiL/pRwr42+yuTlFSF+4skgonyX1hIYZTNb/szjjzKGnTe05RjbrEBh9Ks14UD2iqFLLb2aGNq3
	kN9vLTkII1oHdu00ntH7AxxiijYwaEGvGdRbjuj19ZwspN5edQR/gj2FzFdWXwls7My2egUckWLG2
	AzC3T4SZkl8trmITUK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtqLE-001P59-9W; Sun, 05 Dec 2021 12:10:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtqLB-001P4W-Gc
 for linux-amlogic@lists.infradead.org; Sun, 05 Dec 2021 12:10:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 998F9B80E29;
 Sun,  5 Dec 2021 12:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE5FC341C1;
 Sun,  5 Dec 2021 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638706197;
 bh=er9CG0dl6kI/OQu0NRc07mM8HklpBzR67WCeLHEbLOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qmX6K7hcw48wDfzmsVu421SA4/SKB+kgCezeR04dxKLPFVu9e6h46p4FQaKZd4YHx
 erEfaFPqO2ntHLN+HGx3okaKq3ELt5Us4HZvOVt/xOGaTrOwwp9NaAlhxlPOMOdTcS
 E7BiEcL8E9xoPsvZFrbYKpLi8cloP/D1P1fDT7E8=
Date: Sun, 5 Dec 2021 13:09:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: stable@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Artem Lapkin <art@khadas.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 5.10] Revert "drm: meson_drv add shutdown function"
Message-ID: <YaysEhJFqkQWa50W@kroah.com>
References: <20210315135545.132503808@linuxfoundation.org>
 <20211204213157.27551-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211204213157.27551-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_041001_726424_00A8F8A0 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Dec 04, 2021 at 10:31:57PM +0100, Jerome Brunet wrote:
> This reverts commit d66083c0d6f5125a4d982aa177dd71ab4cd3d212
> and commit d4ec1ffbdaa8939a208656e9c1440742c457ef16.

No, please, at most let us revert the commits individually.

> On v5.10 stable, reboot gets stuck on gxl and g12a chip family (at least).
> This was tested on the aml-s905x-cc from libretch and the u200 reference
> design.
> 
> Bisecting on the v5.10 stable branch lead to
> commit d4ec1ffbdaa8 ("drm: meson_drv add shutdown function").
> 
> Reverting it (and a fixes on the it) sloves the problem.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> 
> Hi Greg,
> 
> Things are fine on master but it breaks on v5.10-y.
> I did not check v5.14-y yet. I'll try next week.

Please check 5.15.y (5.14 is long end-of-life).

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
