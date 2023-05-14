Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C4DC77B7F
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 May 2023 21:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jt/iR+uRN9SGFd+qCwVIQGYgZU9fcsMYZEKzGrAWyM=; b=iBtYKDBHKGs8t/
	u8qz+WHlDe2qas0qNGVl0u5pHI9olRjM+cdcByBHF3GczGMOd93a5/5ijNgSC0sdZ6REys6wf3XsN
	JBIZ/S5reOsvu/1BZHlFDlBEMtG38pj3Uiy9xOr7TsbqJoNaRTcPW5un0gQPhmRIDXzfNipXyEWtr
	Qg23NQiZeu/RBZA+ZJG8QAWuuOA0AOoodyxu5A64GwiuSCgSwEPUuv8d/OTZzX8n00VVJ2WMST7U8
	jDi425SJ3x6cTD3k3x2/nlIrPNa43czEpEl0tppbSF2xUaVWG9r2PK0HffZAFKuJ0alAoQ8oNQMQw
	43N2zU5DJ5GLixhUcVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyIqk-000Egd-0K;
	Sun, 14 May 2023 21:01:50 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyIqg-000EfJ-11;
	Sun, 14 May 2023 21:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1684098099; i=hfdevel@gmx.net;
	bh=JLpbwCKl/yHzTYYr9JyJyKY1h8yVM4J1x+alUlH1beM=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ODpyOExqhqoZCc2/Jevl7zpR94kQzq1xsoQYuTlmQ97eB23RJNHFSk6hi8h4xmhtb
	 1lmxRBftQdHnbcIweimorVf5nVh4DlPiWIZGmn/i0ZEig6Z/UJoFERuVQ3AKxC9xP0
	 0YHv3pOwvVWeikzjzQieNGTCcu17sw3PjJ/wo2ZiSuGReiT3rJ07lv258eVgSty7z5
	 cBgxuPJi5MqvtT9WA+mVXZ76Vw02cYbT5eHgXqJgHjo6hhyC1BJ5DyAFNWCr2mE0sI
	 ZWlzCyK8OrydUgj1cQMW24LOdZ1frdBtptgtn27VdgBSXuXLpgKk1WkKrKTwYcgm5Z
	 /SBv5NbnMTS4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.115] ([93.236.68.89]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmfi-1pac7V2xZK-00THLA; Sun, 14
 May 2023 23:01:39 +0200
Message-ID: <2558ba71-4f51-e186-b51b-554a72f19e19@gmx.net>
Date: Sun, 14 May 2023 23:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] ARM: dts: meson8: correct uart_B and uart_C clock
 references
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org
References: <20230514201909.506090-1-martin.blumenstingl@googlemail.com>
From: Hans-Frieder Vogt <hfdevel@gmx.net>
In-Reply-To: <20230514201909.506090-1-martin.blumenstingl@googlemail.com>
X-Provags-ID: V03:K1:MV78Ss+OjvEaNrHx16nfBXIHCLTC7Ys8s2TdTwCjE3dTlJe83ZE
 6jHFq8nXsjDmdK3p0KVViOwM6/QONvZuG7JUMbAWuMbNEwLI3EAvA/3dkLYZenlfjTIusBp
 sf6FfrKBzB5g4w9TYrA43j/JyScals/3QM0MZCbRQASD4eqqeJ7/EMjymNnXS2pMgfSIqs2
 3kHJabv1Np3bIHT9RrM4g==
UI-OutboundReport: notjunk:1;M01:P0:ZcaPssHlN6I=;pHTHtw55Yrs3yMe+N+sXIPn0TYK
 LysSkXpCPKlM0tDe6Gga8PIbNilx7IoZYiy4zKtf4jsLeAnxicfHdUFiWS5rtgqMeOlkR2t5J
 nuht1biPbUbr9AGmXUZuxFhcNWEk42tNmWpNJj+Bbudj+wMaNwDnRDNiQnkHfSIgXh3AQK4n0
 cWWIRnkNdTUoW5xmC5Vl7fqZF1AodLW8lJSBSfykt7v3nxpT+hRmwFx8+HkP/ZakLI/6cxmxU
 RMGJWpLToBzjxH8mFm39XeYks/2c87cEDPZ09P2/kireCkMt1Yh3YRQ/x6TwgT41gBl/UAdrj
 ZS8YZ8y1RWC1xyDs1ujRnFhHWd8aAl32ZfApgoGqDGTRg95w/4/nIQ/jxZxFcHeIfrLH6IXk5
 8XxvERp/xqgYz14OF9LxmKjOPhN8dSUCSNtyNyeU8T8Zf8mXQ9AYgBC85bV3P6QN3nzSMh1Y+
 uk5OojvkZswvzJTXKFfFJccwMB101LdIrreJBb83xashZ0DoAFs21YHE+7Z0e29qWxkB7+9Jo
 61QsXWW5nXyfcd4Az0Fi+9KlY6BZyzRq6R00TRRszUXCcoUE1hLB3f2L5RotQnCZ7mztleMJp
 FsawMK3MP+zWljJVOfVpeR2srb93koNRSEoHdmH9ohyOlXQAtGQ84Gyh+IO5vHP189NwzDYZK
 xqEydU2w817wi0ycu9Bc/wUlXZIohLXhrmgBdfyxlgQAnZl1MKW9VSIxhoWWNGkEREpTPmC98
 EcrPD4agfOF4bn3MnJlU+tZLmoBCLzHswi/3Q0YKtECn1a9FJJku/aZ+xcA2tNq265bAkgxUE
 gQ+3td5PBa4YFzTfy3b0lp8PEnEdhDx1u7TbSsGECOjOUSQLNT1aJt5KdzPv80ZDnBMP/6Gmj
 +XtzYQz1luuvdIiYWjUzvRXXTf2b4cGKaFb3dkMGYsdlzGmqqwDFDlePCo2UlYqNGC/yRfPTC
 N35bSA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_140146_825832_5DCB7FAC 
X-CRM114-Status: GOOD (  16.18  )
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

On 14.05.2023 22.19, Martin Blumenstingl wrote:
> On Meson8 uart_B and uart_C do not work, because they are relying on
> incorrect clocks. Change the references of pclk to the correct CLKID
> (UART1 for uart_B and UART2 for uart_C), to allow use of the two uarts.
>
> This was originally reported by Hans-Frieder Vogt for Meson8b [0], but
> the same bug is also present in meson8.dtsi
>
> [0] https://lore.kernel.org/linux-amlogic/trinity-bf20bcb9-790b-4ab9-99e3-0831ef8257f4-1680878185420@3c-app-gmx-bap55/
>
> Fixes: 57007bfb5469 ("ARM: dts: meson8: Fix the UART device-tree schema validation")
> Reported-by: Hans-Frieder Vogt <hfdevel@gmx.net> # for meson8b.dtsi
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes since v1:
> - move the link to the original report for Meson8b to the description
>
>
>   arch/arm/boot/dts/meson8.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 4f22ab451aae..1054297fa69f 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -769,13 +769,13 @@ &uart_A {
>
>   &uart_B {
>   	compatible = "amlogic,meson8-uart";
> -	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
> +	clocks = <&xtal>, <&clkc CLKID_UART2>, <&clkc CLKID_CLK81>;
Shouldn't the second clock reference for uart_B rather be CLKID_UART1,
similar to meson8b?
Sorry, didn't spot this earlier.
>   	clock-names = "xtal", "pclk", "baud";
>   };
>
>   &uart_C {
>   	compatible = "amlogic,meson8-uart";
> -	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
> +	clocks = <&xtal>, <&clkc CLKID_UART2>, <&clkc CLKID_CLK81>;
>   	clock-names = "xtal", "pclk", "baud";
>   };
>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
