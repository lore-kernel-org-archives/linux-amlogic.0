Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76247C61DD3
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTg70VGHruVK03gL5PTb9Q44ulckT9sVkTf/AcJbusk=; b=GFZIzGBQDkeYs1
	Vh2ZvXbn5ikb5AaTUC3iGJX/SViyAr6jniTj5FjGXfORjjhz7Z0SWwmErScd3zvgmJNta7mdcyvGd
	KI2fNhU7wKEp40dtt7S6WeAOgtYQ/JbXhcEeCzqwVMk6XWzzuiU9OZ/m9Y1batUfP8yJKroQcWrvh
	mq3/z1zxU0xPzmFD4WqTstHWBVXGBhl+jDPd6xZQ+l6sVhSKGxowr1pZ7jq05fUZW81nDLk0Yh6EY
	jiK2crjdgdgDUyUdHczscI13WmaYMIv7VSYBebqDVdWghQgPYkYEbG9qGKbGnrdX0fesopFJ/kFj6
	7CK/khowJOO9eTmV/Ojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22U2-0000000GkOT-0HKA;
	Thu, 03 Sep 2026 08:07:42 +0000
Received: from hqu.edu.cn ([210.34.240.11])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Ty-0000000GkNU-0nRC
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 08:07:40 +0000
Received: from [198.18.0.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gAnitnFKplqiRYHAA--.14660S2;
	Thu, 03 Sep 2026 16:07:34 +0800 (CST)
Message-ID: <516d8904-ea21-4039-a621-b98a8a5cea83@stu.hqu.edu.cn>
Date: Thu, 3 Sep 2026 16:07:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: Neil Armstrong <neil.armstrong@linaro.org>,
 sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903073643.B92A71F000E9@smtp.kernel.org>
 <ff197003-be1d-4934-bf33-9337bc833168@stu.hqu.edu.cn>
 <3fc38e1c-d9cc-493c-a25a-61a8a173d987@linaro.org>
From: Raspberry Kan <raspberrykan@stu.hqu.edu.cn>
In-Reply-To: <3fc38e1c-d9cc-493c-a25a-61a8a173d987@linaro.org>
X-CM-TRANSID: C_Ai0gAnitnFKplqiRYHAA--.14660S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWrGw4ktrWxJF13Xr1xAFb_yoWDCwc_Xw
	sxuryDZ3yUJ3WrZ39aqrn5Cryqgw4aqryayw1DWw4fArW3G3sF9F45WryIkF1jyr4F9FZx
	Xa4FgFs7J34q9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2xYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxfHUDUUUU
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCLgACsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_010738_701876_C42E729C 
X-CRM114-Status: UNSURE (   8.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On 2026/9/3 15:55, neil.armstrong@linaro.org wrote:
> Sashiko is right, is it _really_ a GXLX you're running ? The 
> S905L/GXLX does not have the PP2
>
> could you dump the soc info ?
>
> run:
> grep ^ /sys/bus/soc/devices/soc*/*
>
> on the device running mainline linux.
>
> Neil

Of course. Here is the output from the device running mainline Linux:

|LibreELEC:~ # uname -a Linux LibreELEC 7.3.0-rc1 #1 SMP PREEMPT Thu Sep 
3 05:37:37 UTC 2026 aarch64 GNU/Linux LibreELEC:~ # grep ^ 
/sys/bus/soc/devices/soc*/* /sys/bus/soc/devices/soc0/family:Amlogic 
Meson /sys/bus/soc/devices/soc0/machine:Xiaomi Mi Box 4 (MDZ-21-AA) 
/sys/bus/soc/devices/soc0/revision:21:c - c4:2 
/sys/bus/soc/devices/soc0/soc_id:GXL (S905L)|

I also found a teardown photo of the Mi Box 4 which clearly shows the 
SoC marking as S905L-H:

https://data.znds.com/attachment/forum/202106/07/172555ezz4nnyn4gln8yl8.jpg 
<https://data.znds.com/attachment/forum/202106/07/172555ezz4nnyn4gln8yl8.jpg>

Best regards,
YuChia


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
