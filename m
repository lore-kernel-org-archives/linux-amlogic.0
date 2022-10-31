Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3491AFA3741
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 21:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGEURxRkvgQhKYFEC0h5eN+UeiH22dQRB76YVED3z/I=; b=NAIPfnBY7T1AQ4
	5g7fbqiZ7noHUZOBAoYN9ZjDFZMZk/1d3H/Rbzx+dQhOsBaGCfsPYJemnYNFHTFksfrYE5lrqyRzu
	pyh3N3EONeXBfhB1MFJ32+wD37DB9iD1EqxpK0aPFL9LwtyNLUOsFPQl2LV86KziQIXrLPGuwMHAL
	jRn6s4uAX3REtiNpwB29FjS8zKtxpe7/yUVGVK6wRD36qwMe7lbpnLq8G6/m5Q6/KV8gDrITDdSxX
	K3e5v6MywYLyjnwFI56UqKX+c97x+00TbNmXoRwB1BqxTvTs49gdr2sCOb0a3xz8yMPFn6qYtb0Kh
	qxdmbqmzfQpOcaAf6zag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opc9c-00FZ9y-IJ; Mon, 31 Oct 2022 21:17:08 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opc9S-00FZ7T-6J; Mon, 31 Oct 2022 21:16:59 +0000
Received: by mail-ej1-x629.google.com with SMTP id bj12so32511304ejb.13;
        Mon, 31 Oct 2022 14:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lDfCd2FuDOvtKfrsSPo+hRMdeUAtRjfZl9QXKPEK178=;
        b=gDGxs1fY5KUO+uyr19HQao3BICcCY4is90BRyK3f+Qh9VuFmnzfq5aLy3Q3fvGZTJO
         C61v10U4g/1PZ8bt+tS0bq7A4KwqdVn3UeFFHwFjpWdh0VGd29Am/Yk0ACZW56v9CXRD
         IXPPtGC08Z5zDluhG1AjoBQyz0RCQv+CxJoWwPCvyQFn6D9xNGUmFkl5xPkG62SWKw2C
         RkwEcJLgcc/bOlETdlZ7insycx1toun3GuwVlwXTJEewPIXL6CHT5alBNo3jCAgdJ1+M
         YEA/jeimfRkqup57/mhP6rbhkUXv4ZXeEiWZ5ER6V8UcaeUy9z90nOOr1YTdmwb+C48a
         QRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDfCd2FuDOvtKfrsSPo+hRMdeUAtRjfZl9QXKPEK178=;
        b=d5sdeiAUroHmj7TYGbweZhQoHzgi20QyoY27LE5gfaO8mKFhRc5zG0dGGC+S5t+q5r
         GnBldVmccJwqIY97YVUUtpQPkgtMzJ7gofUiPulUEuLkL7RPM0ldNMnOALxY+95Jff+r
         LKzck+DsAP+/y6100uzxD1mxBKG95uh3Mueps0ITfxQ8WkQaCIVk2rsCDL3sg+Mt9Zya
         XZAGqSwAh+U7lmmuWCI/m7BCXLzw0ywVkPialN/jYl1HDf5fV6NVvzL2bm6NJ+1X/oHJ
         5DQjJem2oDuRCJwRRN39zgvfjw+J5DYO/Kqtgon/GfIvBn3qrqKdaud8Smur9mvhYVot
         wmjw==
X-Gm-Message-State: ACrzQf3GG1ngsqLxU8oUZIPmQwoUe2UhTvojwCEiy8DasHeVtrQTVVeZ
	TU2uD7aOT42fh5A2nJMJszEDG3jYCeuY4zJYfgo=
X-Google-Smtp-Source: AMsMyM56K441yZsKmM7JuCfanM6BjR8HaEBggpUvIKn0DtcCrLMNid1v1ldjaleJWeq81Dq/vY9m8bv6b80jQVsyIc4=
X-Received: by 2002:a17:906:7314:b0:791:a45a:bc84 with SMTP id
 di20-20020a170906731400b00791a45abc84mr14851850ejc.394.1667251014365; Mon, 31
 Oct 2022 14:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org> <20221031-b4-odroid-go-ultra-initial-v1-1-42e3dbea86d5@linaro.org>
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v1-1-42e3dbea86d5@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 31 Oct 2022 22:16:43 +0100
Message-ID: <CAFBinCAQKf9RvRWQTCSg7g+7NP_vbEFBUeCoFbYnyfmqeegy5g@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: document Odroid Go Ultra power-off
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Sebastian Reichel <sre@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_141658_265311_8887AE82 
X-CRM114-Status: UNSURE (   7.96  )
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

Hi Neil,

On Mon, Oct 31, 2022 at 5:47 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
> to its two PMICs in order, this represents the poweroff scheme needed to complet
s/complet/complete/
> a clean poeroff of the system.
s/poeroff/poweroff/

Please wait with re-sending this patch in case the dt-bindings and
reset experts have more to say than finding typos.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
