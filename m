Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD95C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Nov 2022 09:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0F68AzVqqkApe51p6tDruVvpUzbpVRKQiA1thkhgfoc=; b=NCbqplGl5nL/JQ
	9TLt+PFsk3echhagzgVvoKlWrA8Ugwhyg+4p/qq/rW8BeQuLzg45rgMtpGZ6RY1/ASlT6QJS2Wmr8
	ubhjBcWk9LS74eX7crS7gn70CNusUg0IPDAyD2cr2lFa5EkO1EJCtNBRO0++Bs/4etRWxvLkjCXnT
	g4bvS7PzlL6HtDQSa0WGWZJmrAHn66xWyggTuFGdi0nwLRJv3QUmbCP2b0p7uZYiLiZb8NelzqFi+
	o/0idIM8B/Ioj8gY4Tl0boRNMN+bybe4aPWQ8QN/b1gul8gx0NvIL8reXKvQEkeTPcWNgg9Pn32aM
	k6KMt2y1D55Kd1J075WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovF8u-001zwq-Nx; Wed, 16 Nov 2022 09:55:40 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovF8i-001znj-R2; Wed, 16 Nov 2022 09:55:30 +0000
Received: from [10.88.19.158] (10.88.19.158) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 16 Nov 2022
 17:55:26 +0800
Message-ID: <7bb5e9ee-358b-ce6f-2cb5-a6b6b558c0a9@amlogic.com>
Date: Wed, 16 Nov 2022 17:56:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v10 2/2] docs/perf: Add documentation for the Amlogic G12
 DDR PMU
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>, John Garry <john.garry@huawei.com>, Wan Jiabing
	<wanjiabing@vivo.com>, Chris Healy <cphealy@gmail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, Chris
 Healy <healych@amazon.com>
References: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
 <20221116003133.1049346-2-jiucheng.xu@amlogic.com>
 <Y3SwIPnDvEOlL+Mz@debian.me>
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
In-Reply-To: <Y3SwIPnDvEOlL+Mz@debian.me>
X-Originating-IP: [10.88.19.158]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_015528_914551_2C18BA87 
X-CRM114-Status: GOOD (  18.45  )
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

Sorry for my poor English. Your writing looks very elegant. I will apply 
your modification in next version.

Thanks,

Jiucheng

On 2022/11/16 17:40, Bagas Sanjaya wrote:
>
> The wordings are rather weird, so I need to improve the doc:
>
> ---- >8 ----
>
> diff --git a/Documentation/admin-guide/perf/meson-ddr-pmu.rst b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
> index 15e93a751ced8a..4a1fdb5aba4b24 100644
> --- a/Documentation/admin-guide/perf/meson-ddr-pmu.rst
> +++ b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
> @@ -4,11 +4,12 @@
>   Amlogic SoC DDR Bandwidth Performance Monitoring Unit (PMU)
>   ===========================================================
>   
> -There is a bandwidth monitor inside the DRAM controller. The monitor includes
> -4 channels which can count the read/write request of accessing DRAM individually.
> -It can be helpful to show if the performance bottleneck is on DDR bandwidth.
> +The Amlogic Meson G12 SoC contains a bandwidth monitor inside DRAM controller.
> +The monitor includes 4 channels which can count the read/write request of
> +individual DRAM. It can be helpful to show if the performance bottleneck is on
> +DDR bandwidth.
>   
> -Currently, this driver supports the following 5 Perf events:
> +Currently, this driver supports the following 5 perf events:
>   
>   + meson_ddr_bw/total_rw_bytes/
>   + meson_ddr_bw/chan_1_rw_bytes/
> @@ -16,55 +17,54 @@ Currently, this driver supports the following 5 Perf events:
>   + meson_ddr_bw/chan_3_rw_bytes/
>   + meson_ddr_bw/chan_4_rw_bytes/
>   
> -meson_ddr_bw/chan_{1,2,3,4}_rw_bytes/ events are the channel related events.
> -Each channel support using keywords as filter, which can let the channel
> -to monitor the individual IP module in SoC.
> +meson_ddr_bw/chan_{1,2,3,4}_rw_bytes/ events are channel-specific events.
> +Each channel support filtering, which can let the channel to monitor
> +individual IP module in SoC.
>   
> -The following keywords are the filter:
> +Below are DDR access request event filter keywords:
>   
> -+ arm             - DDR access request from CPU
> -+ vpu_read1       - DDR access request from OSD + VPP read
> -+ gpu             - DDR access request from 3D GPU
> -+ pcie            - DDR access request from PCIe controller
> -+ hdcp            - DDR access request from HDCP controller
> -+ hevc_front      - DDR access request from HEVC codec front end
> -+ usb3_0          - DDR access request from USB3.0 controller
> -+ hevc_back       - DDR access request from HEVC codec back end
> -+ h265enc         - DDR access request from HEVC encoder
> -+ vpu_read2       - DDR access request from DI read
> -+ vpu_write1      - DDR access request from VDIN write
> -+ vpu_write2      - DDR access request from di write
> -+ vdec            - DDR access request from legacy codec video decoder
> -+ hcodec          - DDR access request from H264 encoder
> -+ ge2d            - DDR access request from ge2d
> -+ spicc1          - DDR access request from SPI controller 1
> -+ usb0            - DDR access request from USB2.0 controller 0
> -+ dma             - DDR access request from system DMA controller 1
> -+ arb0            - DDR access request from arb0
> -+ sd_emmc_b       - DDR access request from SD eMMC b controller
> -+ usb1            - DDR access request from USB2.0 controller 1
> -+ audio           - DDR access request from Audio module
> -+ sd_emmc_c       - DDR access request from SD eMMC c controller
> -+ spicc2          - DDR access request from SPI controller 2
> -+ ethernet        - DDR access request from Ethernet controller
> ++ arm             - from CPU
> ++ vpu_read1       - from OSD + VPP read
> ++ gpu             - from 3D GPU
> ++ pcie            - from PCIe controller
> ++ hdcp            - from HDCP controller
> ++ hevc_front      - from HEVC codec front end
> ++ usb3_0          - from USB3.0 controller
> ++ hevc_back       - from HEVC codec back end
> ++ h265enc         - from HEVC encoder
> ++ vpu_read2       - from DI read
> ++ vpu_write1      - from VDIN write
> ++ vpu_write2      - from di write
> ++ vdec            - from legacy codec video decoder
> ++ hcodec          - from H264 encoder
> ++ ge2d            - from ge2d
> ++ spicc1          - from SPI controller 1
> ++ usb0            - from USB2.0 controller 0
> ++ dma             - from system DMA controller 1
> ++ arb0            - from arb0
> ++ sd_emmc_b       - from SD eMMC b controller
> ++ usb1            - from USB2.0 controller 1
> ++ audio           - from Audio module
> ++ sd_emmc_c       - from SD eMMC c controller
> ++ spicc2          - from SPI controller 2
> ++ ethernet        - from Ethernet controller
>   
>   
> -The following command is to show the total DDR bandwidth:
> +Examples:
>   
> -  .. code-block:: bash
> +  + Show the total DDR bandwidth per seconds:
>   
> -      perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
> +    .. code-block:: bash
>   
> -This command will print the total DDR bandwidth per second.
> +       perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
>   
> -The following commands are to show how to use filter parameters:
>   
> -  .. code-block:: bash
> +  + Show individual DDR bandwidth from CPU and GPU respectively, as well as
> +    sum of them:
>   
> -      perf stat -a -e meson_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 sleep 10
> -      perf stat -a -e meson_ddr_bw/chan_2_rw_bytes,gpu=1/ -I 1000 sleep 10
> -      perf stat -a -e meson_ddr_bw/chan_3_rw_bytes,arm=1,gpu=1/ -I 1000 sleep 10
> +    .. code-block:: bash
> +
> +       perf stat -a -e meson_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 sleep 10
> +       perf stat -a -e meson_ddr_bw/chan_2_rw_bytes,gpu=1/ -I 1000 sleep 10
> +       perf stat -a -e meson_ddr_bw/chan_3_rw_bytes,arm=1,gpu=1/ -I 1000 sleep 10
>   
> -The 1st command show how to use channel 1 to monitor the DDR bandwidth from ARM.
> -The 2nd command show using channel 2 to get the DDR bandwidth of GPU.
> -The 3rd command show using channel 3 to monitor the sum of ARM and GPU.
>
> Thanks.
>
-- 
Thanks,
Jiucheng


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
