Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71F9C7619A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 05:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fe1VMb7bY/M4ilLiWGQ+yBKEHRFdA55wlOJObko+SXA=; b=2CdohYqDcDtdN5
	EA0FfOKstCriLIw3b9FVY24tWyExGZi4fvLvrma4kow6dH5jNX2p/NBkFYRTvxYnO2nxqBndb0TBC
	FWMTsd8UnSzkyi3/d2fC7uXj70yLJtRLw+1zmuMFeduHQDex2JJrZAtti9RQ4cQRxk8/CdP1/JvW9
	Bl5qZbIp8JeThQKfyXw9eFzSBThyGVD+5KHinppGnC9y+XCSwV73oXv2JP4kwi9Uaa07HMPNd/Er9
	QoOONgzvUAErcMnqrrfw0lcsCpPkQzkfGJfCGxYK1KYCApGdZ41jo2TceKAhhZUMggacYWdwZYIFx
	ri3HLafuvh4orutGPgGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm6sf-00GVPM-1L;
	Tue, 11 Apr 2023 05:49:25 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm6sc-00GVNN-2F
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Apr 2023 05:49:23 +0000
Received: by mail-ej1-x62f.google.com with SMTP id kt17so5256546ejb.11
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Apr 2023 22:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681192158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vxeDgr55vqK9Nw6EqARoCAgzkY6/iCq/2nGHZU3lT+Y=;
        b=UU0RB4sf7TL3sE5mWdKr1STGDqwy506TZg46i4mdo9Aa9ZLvZblxVJPHw4XrtwYD13
         aW9s180Sef9eoZaJghCJRrCyuQlEOPVyy6qtEnNW5uBUDI4mR+A4K2g2zsiaEtIDlUW1
         PltOJNRkZDhDtc/AH5l/+Z8m64Ry01Li/xQFya02DAMlCPUP+wfAPO2lLCDEkmudnOUv
         4t92cLo7vha6J8xC3gHvC8Ws+NFUU7x+6BKr0Y5SO3WOiklXR+j3U0lEbcDeDPku42Po
         2sDMkqzy8EaI4YRUe62MZpwSP7i1NzlyBmQEnSO90k0fT+kOJjRkehM8iIuOJzePCKYj
         7xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681192158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxeDgr55vqK9Nw6EqARoCAgzkY6/iCq/2nGHZU3lT+Y=;
        b=JshEk5iH+XfxPFv2emPTRWqUhdz3xj1wEpzaSEfBIiIza1VwAhVRKMkpEu/gJJGBFy
         BZjDAJ4Uf/KqIhkVnifHipzr1g7qtvfrVHA4SLpwWqG4Y3GXSZiJYwx9IIahxHW4MpEn
         npVC2HosNzVQaMsdzceVFSd7sx4djhARMe3PcjgjZzAIvtp785xn7s8J8wgbUlp+3AkQ
         bWm7p87Q87GWR8yq1xfLOs28aENqPQZuMRhN7mtHrfGKXv8d35jAO1A05pLqqsrVEKB1
         sEp47W6C+Q0lEGPvg1AOZ3CGrvMW4j/PXyNyYSBrCsaUBR4xO+tbbP3MciJHee2uWAXe
         /dEA==
X-Gm-Message-State: AAQBX9fzLI2GcMZM3u71NsbuqUwcMsaFwopLabTgNnTQpV+zJmtSDF48
	P5gLznT1hUYNHhJdVidGpb4fYQ==
X-Google-Smtp-Source: AKy350YyS5Zhb8pkBcql1XreQOfj7fk82rri+z8xLfHUQnfogNIgxv2zgRSWTXeFQ7bpqjqMdccfqQ==
X-Received: by 2002:a17:907:a395:b0:94a:6e08:fec5 with SMTP id se21-20020a170907a39500b0094a6e08fec5mr6220735ejc.29.1681192158208;
        Mon, 10 Apr 2023 22:49:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61? ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
        by smtp.gmail.com with ESMTPSA id kq9-20020a170906abc900b0094a5edc82b3sm2513438ejb.162.2023.04.10.22.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 22:49:17 -0700 (PDT)
Message-ID: <489c3051-702c-7aa1-8def-a02aafc4602b@linaro.org>
Date: Tue, 11 Apr 2023 07:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: add Xiaomi Mibox 3
 binding
Content-Language: en-US
To: Karl Chan <exkcmailist@inbox.lv>, linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Karl Chan <exxxxkc@getgoogleoff.me>
References: <20230410193048.31084-1-exkcmailist@inbox.lv>
 <20230410193048.31084-2-exkcmailist@inbox.lv>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230410193048.31084-2-exkcmailist@inbox.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_224922_739794_AB828016 
X-CRM114-Status: UNSURE (   6.55  )
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

On 10/04/2023 21:30, Karl Chan wrote:
> From: "Karl Chan"  <exkcmailist@inbox.lv>
> 
> Add the board binding for the Xiaomi Mibox 3 Android Set-Top Box device.
> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>

Your SoB does not match committer.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
