Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C6AC46CD2
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jan 2024 22:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UO+h0C6VKBk8VvPXDDzOFip1zcJyoCNJfK6SFU+m89k=; b=NM2Ug4njeym1t8
	PP1gVq/O8XLFrD5vCSZg54NieuQ/IVUikfqR9+i6dY+rrQa6jLuVw0A6wpx8l9hPYr09ADL/uXdUd
	x39vMYX8DtyIV8+B/8SSfC/XAV0iONEut7cSkYJWEnamUQx+JEcvynqfG/xZJdkznUuZnx00UXcmf
	QL5gamDq6Z5ynp0enNyA0QKWXgZ3aqSeMI3fKj9uN8TPapicL8FtbtbiiorkimOrsOZkL7ummHYqB
	xlO1VWm4Z+91MMvw07RN41EKxiecHQjUWSBFW2ZBTGEcjLsXIZYZH3Dwsw2ViiqAlXfrNnmI+hEno
	JPf9PMqt1yjlAZJiEyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTr5m-00000008Ilk-38Rn;
	Sat, 27 Jan 2024 22:24:02 +0000
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTr5i-00000008IVq-2AZl;
	Sat, 27 Jan 2024 22:23:58 +0000
Message-ID: <9f3b5e25-3d41-4c1f-a8be-788f617f4d58@infradead.org>
Date: Sat, 27 Jan 2024 14:23:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] media: staging: meson: Fix kerneldoc
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin Liu <bin.liu@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-amlogic@lists.infradead.org
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-16-eed7865fce18@chromium.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-16-eed7865fce18@chromium.org>
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



On 1/26/24 15:16, Ricardo Ribalda wrote:
> Remove documentation from missing field.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

 
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  drivers/staging/media/meson/vdec/vdec.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
> index 0906b8fb5cc6..258685177700 100644
> --- a/drivers/staging/media/meson/vdec/vdec.h
> +++ b/drivers/staging/media/meson/vdec/vdec.h
> @@ -101,7 +101,6 @@ struct amvdec_core {
>   * @conf_esparser: mandatory call to let the vdec configure the ESPARSER
>   * @vififo_level: mandatory call to get the current amount of data
>   *		  in the VIFIFO
> - * @use_offsets: mandatory call. Returns 1 if the VDEC supports vififo offsets
>   */
>  struct amvdec_ops {
>  	int (*start)(struct amvdec_session *sess);
> 

-- 
#Randy

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
