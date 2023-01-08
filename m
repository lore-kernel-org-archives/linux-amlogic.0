Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84E3C53210
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Jan 2023 03:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1B7/MOAUZQoU6f1j2XUIZF6XJnLSDn+L8T+EMeh/W4=; b=Uro/73aewmh1AA
	6DsXlh7M7oIAnAwmVLwjTcYvs9Xc1+xTmx4wASoKMvu6RslAz/sLSLb7TRDRL5t7+u32nGceTLXOg
	nl2Vn+FeeBKZiCVhgfzpcRL0XdjmglmUiueJmVF/FW3msiFQaJ6xV05haAIjv6wmhxqMMeKx2JIaW
	WBDWuy/pU5UdLYIJb4EVgEGr/da20PPD9DhxJunmC82FmNTZmqAeKOLXUgt/MqOVdVSUGyx6krQh5
	R4zAd5Xtq9B6rQ48MXtitnMUKYulq/z9pp+6wLKG/eARVOo+jM1qIkiJlpeGJi+vt1JYnVad8rmWo
	8vFEVBJm0qsjKNqGgVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEMU9-00BKkY-Dg; Sun, 08 Jan 2023 03:36:37 +0000
Received: from mail-os0jpn01olkn20827.outbound.protection.outlook.com ([2a01:111:f403:700c::827] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pELUH-00AxoE-4B
	for linux-amlogic@lists.infradead.org; Sun, 08 Jan 2023 02:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqGCo9uxz+umldFAzoEPselsk8RZfUHMf4ao0Q0ATMLFF6F3sAJDesF9+0wMkThrlqq5L0b/E/YrSOFXn5opPmaqdbI629ilTCWUlZxlrRSYFJbfEoK+Omf6QylNQrC1L2KMV5Srw0Ix5j6X3TfcmTWE6Bh00RgQAKj3rchptliIITkVbZVQEFq9cqD9zWj8E0YdaBA8L1FCWFltW8K+a+3ezAZboqLceumccOWo3cWPZ7KxCq5U2tPOpfpNj7Y9WI+Fix+LE6L4By7G8U7vEX1UPn5e0WSO9j+8rKKQXtQTVbECXN/ZXM5cJ8VRXHk/fJYlZSkQITXlTRmNGJyc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP+AcXL8Q3tLduFLYqE7+jtOySl9e/AkK0I1y2tZPGg=;
 b=g8zbVbmSL8GjzMM1uqW/VhbOfVk+DHI2hv30gAg5TM6jS82nWpCrdBw0WGZr5Us/lY+sXDazsaTLczBUOpwxMKBdrtDMQRydz8MshJQOXULEf6rKIUzZTiteCbM62bap+Za0RNL5J4raKlLVQuJ8bWZzxuSpffCw7hsJwhPtuHF1mMQzEDalj9Mfef6FvNkr35f6USpzcvTMgivGegzypTRViyHG9+jehHukPKlV5ABxLYJLml+xMIsD0ZX5Ahjti3nik/DNpWCgX8k90C4PrpRCPeKfHqEpp4MhJ1/1pxXGBUg9LpszzMOPvy009MNv49zpWXLg6b7jIgjRVenqww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XP+AcXL8Q3tLduFLYqE7+jtOySl9e/AkK0I1y2tZPGg=;
 b=KnWur1cWCG285hEsxihCvgLrw4oJl/+H3f9P3PPBqL/5EQOHbT8HTbJPtmxMtvsW+mZVnmchqfGLGL2EK1zrkHg7DDRjMjI5JGSjUFPQKtJptymh7NyoKNAeM8rux1mlnB/WXMgR1ywvBt7HZerSUBDDTBVil5YbA3MrwNJn+Hcebbgc9P3UfhkeyloahRE8n5lWWfC9VsBppwxai6DuAgGQ0uQHzwLm1/+2+NJLyjn/edUoVPlxY6g+gYmCBZXH4AAg5P6OAkzPtyVcwCPW4rrtv1nQ9fwYFaYFA16IRt3aluGrzI6exoAQW2jsuSyn7pwHkZc8Vdga8zNseSMZhg==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by TYCP286MB3364.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sun, 8 Jan
 2023 02:32:33 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46%2]) with mapi id 15.20.5986.018; Sun, 8 Jan 2023
 02:32:33 +0000
Date: Sun, 8 Jan 2023 10:32:27 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-amlogic@lists.infradead.org
Subject: Re: failed to start gnome/gdm3 wayland session after apply NPU
 patches
Message-ID:  <OS0P286MB0641D37F1C6DE383018A3F9CCDF99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
References: <OS0P286MB0641E5D5C1CF9D1E100EFFB6CDED9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
 <c8322c28-656a-64cc-58fe-668026723821@collabora.com>
Content-Disposition: inline
In-Reply-To: <c8322c28-656a-64cc-58fe-668026723821@collabora.com>
X-TMN: [e/Ph+pIcQviQ3H2ojMEIht3zqhR5rWWttHcZPdTbTl3YNsv26lgu+gw65A2iVa8f]
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Y7orO2Eohmi5MLW7@orangepipc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS0P286MB0641:EE_|TYCP286MB3364:EE_
X-MS-Office365-Filtering-Correlation-Id: 603ced41-e0a0-4665-41b0-08daf12098af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Wx02vf5ReNr+K8XreEc6BVV8LKf5jH2XO4kNmGeO1yD4Gzu+h48O9bTwY25NvJUGl3a9VapGKg6HyaChqpX6qUZUoS6WIbrw4yV96cW9Kt3vhlBPLynAu3Bqrlt+6athk51BRm+IPJ0r/n97o9ujr0vcZqOI8Kw4uyz2OowHTtYvS/lGd+1xtNcgfcoFjP1wXmUjb4QP6qCAMusFRD0koLRwn8/oAI1FZssVTMCh9pNRhgM+D7qlF4Tztw7Y9JiyXjL5MBbFWoBaauj8VhKzCGgSoJ2JlnMFjEndhqrgmlq99LcnNfmcQWIhLI3LBuBMiIU/anCSI5MsnvjgBR8aFRAZOj2167txsIr71JLoKCmevR9gvyu+irOUeMhbRnzzLYz4Pj85qHlUQCgCer3JOg7YIwuZo3S5yOi8HzlE4c26qh9jtkMjHXZpTRXKdghl3DPUC915r2tVTRprj9W9fR8TigJBw2ljqKTtttfAD6S7/xTJIlZ697YDcqpphh8BoGAnaPIVXHynXhVirWcleADWyUaCFMiyupQJsPZ2pI/kHAnek/Ucqpjy9cZlF8oOEJcq303UMZxnf06t5YNzg0jyAx4qHQ0tQCi5E9uFTstX9elYQyGPHTOKV5w3fv5a/8NaUwyx0Lny0nHRPX/+bFemCtNz4X1J5P+Qkd5QQugPZNjU/m4nMq/tORLmv6k4
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UTRqaGZSOUF2SjVZWkVnaFdMOXRxQmF4aFNhYmFpemtyYWZMd25QcWJHVzhi?=
 =?utf-8?B?UnROYzVzZEVaOW9lczFLNVZDNU1nQmhxZno0VUdTZHQ1UW00NTFwQVRNck5L?=
 =?utf-8?B?SXdEckVFaHJpcE40NFJDaFAwNXBnYnBUZnc3Wi8wbEI5KzlyVFBYdk9JQWg5?=
 =?utf-8?B?WTE5eEd6TlE0OXNmcTJ2UGs3bC8wSG81SURJS0RMOW8vdk1BV3l0MjlwblVv?=
 =?utf-8?B?UHFYSFpsaVhZNHBza0VVMFhPM00vLzVzSHRhMWVBRGEyQzM2YnVTaVRpSmNx?=
 =?utf-8?B?V09kM2F4ZDlyUDNtT0lKUmZ1VTJJNEpOcDgwWitoeTZhaGFjQ09ieDh6dWkr?=
 =?utf-8?B?b2xqK2F2TnIvRTBMZkJqdkk3aUN3eWN6QUhpeExuQjBTSXRLZlBjZmttc2dM?=
 =?utf-8?B?STR2bUJkN09CUzIyMTFUazdBSnRranl4NURmOVhPZ2xHUG8xZUFsUlppTWhz?=
 =?utf-8?B?M3BNNGRHdDNJbGdRNFdBRk1zbW9BV1pUVUdQUHBnYXMzSkk4UmJNeHRaTEFC?=
 =?utf-8?B?UnNMMlJnemVMTEVteG1NWGtKV0gxazRhTmJVTWU0VHRFWDRoOWVyMDJQYy9t?=
 =?utf-8?B?Z2huV0FzKzkvUDMwLzNtRTNrbFRyVitDUWprUmVBZU9iZjNPY0NMb3lNZG04?=
 =?utf-8?B?S1lHWkl1TjVnMmIvdGFQeDZ4a0IyN3g0dU5PS0hXL0h0ZGNHYkFPQ3UzdFZ2?=
 =?utf-8?B?bTBweHNCbDQ2M2x0WTh5V051UDZUSHdMVHRLRFN3QVNuQXUxeTJPNU04UWlO?=
 =?utf-8?B?Qy9PME5VK2xkNnNaUXlyb29zOUFZTE1qN3hjcVg2ZjBIUnlXYWNFdGt4bUk4?=
 =?utf-8?B?WHNMRTNsSTlXUWg4UVRKckZFUDFBMTNYRzRmMEk0bXplZVIveE50SUJodzZn?=
 =?utf-8?B?QjRrc3FGZWMrdVVHUUxQUnhtMWRlTmxxSmNoSWxNT0hJd2hVS3MybnNPMUFr?=
 =?utf-8?B?WkQvdllxSGNyRGd3c003cWE3dnl0MkYrNTl3VGRlSzJqYWw0RDVSWi9qQnlL?=
 =?utf-8?B?OVRxQ0ZxL0cyTWhkSmM2OUdkUG0xRU9nWldPSUtrTEFyQlZXTjlGa2QwdDBP?=
 =?utf-8?B?MTZTbzNKYjBER0VmRnJpRjdQWmpVUkJ3UVgyOHV2ZHh5QTdja09iRFB0VWEw?=
 =?utf-8?B?MmQydStiVCtUbjZlMElnK2gyTWl1bmREY05iTFpwVUpQZGpNciszd2VTdEpn?=
 =?utf-8?B?a0hmY0JqTVErbkUxQWNBZHdwclhSM2lleDZUby9yTFBXMXl5OVpiVVNMVlZx?=
 =?utf-8?B?T1h6eFRDZVBqdGh1ZjVuUlVnUG9vcVZiRmFJWGlZSTkwYVZLQk9SRS9oNnVP?=
 =?utf-8?B?K2MvSVhNL0RQaW9qa3BRU0NkKzk2bXpVU0xUQWVOeEJRKytXbGJWOVVnci81?=
 =?utf-8?B?YitXS0FCam9xUDlUTy9rZGpxOWlaTGhXWSswUURsU1B0M0dyUTJaNnNORVhN?=
 =?utf-8?B?bFpBemRlQ0UwajVPb3ZiUWtWQWUwOVV4UVVmYzJjU1RwZ1B2QjVkQ1g1Q0oz?=
 =?utf-8?B?ajdEa1NDS1F5NjNtSXIzS1NFUlpoVXcxRVV1OXl5ZndpdmhLdlFrRDZEQ2Vy?=
 =?utf-8?B?Y3BtUjlHdEpycVREclRBclgxdEFpa2E2VUxkOCtHeHpxMW5EYUVvT2orMW4r?=
 =?utf-8?B?cS92SWtDaWRkbUZxdDV2M213UkhiWWZOVlhpRnJQYWgvRGw3ODhPdktYRENM?=
 =?utf-8?B?UCtQVFlLWHF5MjRHRVlPSlFhRERMbmEwdVVHTlhndHY2cU5WSGpHelg5U1F5?=
 =?utf-8?B?ZW9USndZSmJhcEQ0ZmRzRnFxZGI5R0VjWWhmMk1wWWRaTUxtRnlXb1BTc3Z3?=
 =?utf-8?B?dmNnVkZBZGZ3Y3dSQ3FNdz09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603ced41-e0a0-4665-41b0-08daf12098af
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2023 02:32:33.3591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_183241_204579_6C885B8F 
X-CRM114-Status: GOOD (  11.96  )
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

On Tue, Jan 03, 2023 at 03:46:00PM +0100, Tomeu Vizoso wrote:
> Hi Ning,
> 
> On 12/27/22 05:21, Zhang Ning wrote:
> > Hi, Tomeu
> > 
> > after apply your NPU patches:
> > http://lists.infradead.org/pipermail/linux-amlogic/2022-December/014428.html
> > 
> > VIM3 failed to start gnome/gdm3 wayland session.
> > 
> > before:
> > 
> > VIM3:~$ ls /dev/dri/by-path/ -l
> > total 0
> > lrwxrwxrwx 1 root root  8 Dec 27 04:06 platform-ff900000.vpu-card -> ../card0
> > lrwxrwxrwx 1 root root  8 Dec 27 04:06 platform-ffe40000.gpu-card -> ../card1
> > lrwxrwxrwx 1 root root 13 Dec 27 04:06 platform-ffe40000.gpu-render -> ../renderD128
> > 
> > after:
> > 
> > VIM3:~$ ls /dev/dri/by-path/ -l
> > total 0
> > lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-etnaviv-card -> ../card0
> > lrwxrwxrwx 1 root root 13 Dec 27 04:10 platform-etnaviv-render -> ../renderD128
> > lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-ff900000.vpu-card -> ../card1
> > lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-ffe40000.gpu-card -> ../card2
> > lrwxrwxrwx 1 root root 13 Dec 27 04:10 platform-ffe40000.gpu-render -> ../renderD129
> > 
> > the fail log:
> > Dec 27 04:10:42 VIM3 gnome-shell[673]: g_hash_table_destroy: assertion 'hash_table != NULL' failed
> > Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to open gpu '/dev/dri/card0': No suitable mode setting backend found
> > Dec 27 04:10:42 VIM3 gnome-shell[673]: Added device '/dev/dri/card1' (meson) using atomic mode setting.
> > Dec 27 04:10:42 VIM3 gnome-shell[673]: g_hash_table_destroy: assertion 'hash_table != NULL' failed
> > Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to open gpu '/dev/dri/card2': No suitable mode setting backend found
> > Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to initialize accelerated iGPU/dGPU framebuffer sharing: No matching EGL configs
> > Dec 27 04:10:42 VIM3 gnome-shell[673]: Created gbm renderer for '/dev/dri/card1'
> > Dec 27 04:10:42 VIM3 gnome-shell[673]: Integrated GPU /dev/dri/card1 selected as primary
> > 
> > how to configure system to boot to gui with npu enabled?
> 
> Maybe you can do that by setting the "mutter-device-preferred-primary" 
> udev tag for card2?
> 
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1562

Hi, Tomeu

I have tried this method.
cat /usr/lib/udev/rules.d/61-mutter-primary-gpu.rules
ENV{DEVNAME}=="/dev/dri/card0", TAG+="mutter-device-ignore"
ENV{DEVNAME}=="/dev/dri/renderD128", TAG+="mutter-device-ignore"

and it does ignore card0
Jan 08 02:19:06 VIM3 gnome-shell[681]: Ignoring DRM device '/dev/dri/card0'

but the screen still show nothing.
and when I move mouse,

ning@VIM3:~$ cat /proc/interrupts |grep -e npu -e panfrost
 16:       1088          0          0          0          0          0     GICv2 179 Level     ff100000.npu
 39:         24          0          0          0          0          0     GICv2 192 Level     panfrost-gpu
 40:          0          0          0          0          0          0     GICv2 193 Level     panfrost-mmu
 41:          0          0          0          0          0          0     GICv2 194 Level     panfrost-job
ning@VIM3:~$ cat /proc/interrupts |grep -e npu -e panfrost
 16:       1100          0          0          0          0          0     GICv2 179 Level     ff100000.npu
 39:         24          0          0          0          0          0     GICv2 192 Level     panfrost-gpu
 40:          0          0          0          0          0          0     GICv2 193 Level     panfrost-mmu
 41:          0          0          0          0          0          0     GICv2 194 Level     panfrost-job


it looks like gnome-shell still using npu as render.

mutter-device-preferred-primary has same result.

BR.
Ning.

> 
> Regards,
> 
> Tomeu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
