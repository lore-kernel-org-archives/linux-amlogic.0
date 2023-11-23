Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57939C61D97
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Nov 2023 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bFz7KCtLerDtH5iN1kYGQNMd7Tvfw5zH2vC1OfOdyZY=; b=sO1AheNr5ek/g7
	OpojzlOCBFVpaAHoKczndp9rLNw+Nd+85FJLC73W/SrFDuAOPyb7EYZPhRDYnkeAnxdFZrVpzgr9C
	xwJkNqGH6u25XELgwE2fLLDsznRFaIC6Hb/MnA9nzkK+Dw0QCXtHqe+Ll/mgEJ+V8Ki5eULxOJ8Tp
	nyo4EpvL/ag/y6slKT6cC6SwsiC8pM2/24AhhalnSWTZTKVZ1vcS1VHG/Oj8W8dVib+99gH/dMsGa
	oTfasxo6NjG5Gjgik2JzGc6Cz7YXXDjs6+LMufKxxu/+kG22TdO+dZ8bdT8dAHg5VXIex+GU9ovIt
	U17BIXlfiXG5yX3C2jWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6COr-005Gwz-1J;
	Thu, 23 Nov 2023 16:17:57 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6COh-005Gsy-0N
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Nov 2023 16:17:49 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5094cb3a036so1328720e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Nov 2023 08:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700756264; x=1701361064; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pujVRWSCfIATffTNycbDYi4i1pCGIH+ZOcX0lBAR6Ok=;
        b=C93OVvZ2lgvy3a7Yc9vOIoRLRhjqGeB4Qm4xmdoHkxlljYhAc02QxZhPXyoKDUjNZZ
         1mnsuMCdE53oR1la+Tuc+JbegPxuUfFnZZJ4ybO9jLokHp31LEJEGmIZ5F3MwkyDXnsh
         Lo12VClKPX1MIiRfxa6k7F2aUR5ZZw41ErvbSX6s8/uQ6nya/MxNIuEZFO1zUJt/pBHz
         bTrLbLsBDrdPPhWE1UT6Zj3VIBjrYchPVEdGMpONPjHYcZrUTtbiJ7iW7Qs/13YHfpkT
         26jtiDTdFUAv/ZQjklMeaONEpXrQQDg+ZpVzYPPUEtmzObGuhNqmqOu9K9gpvTeivQKc
         gRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700756264; x=1701361064;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pujVRWSCfIATffTNycbDYi4i1pCGIH+ZOcX0lBAR6Ok=;
        b=NCAdY0dq6NgTbrArm5Cb2En+lU30kOtYSUyUtLU/REJccTkZopCXAUsKM7Q0fbS1mi
         //YJltFf9edKj+0A3PKTmvHrA7l5SkKYL0F9FKykRXTP+yDdGxgTLQIdqBxc/Ibcfj04
         /UxhkRnISAG90+dW5S7fSyNJSPl0SwaNN6ML02ESGk5ggUO7HuH3YpILzPYsamneOouw
         cB3Ki/OA0dmwS5S21F981P2ns4GIBDuyd7p2m7uc9oKA+Ueo+Ze6U8Zxp4t2Wi/98Hk+
         rgn6+JdOL/63B2EQj9i6q2UVJTqxaU/7p8DwnkJ1ABkhsngStuu3XCRGBd7Kx9w/S8e7
         KUaw==
X-Gm-Message-State: AOJu0YzJkJithNPdjMHcSlIyurTVU8UmqpKH1idVO8y+4Mr8Hr2nErfv
	mpmbITqlhBcQMyEfVXANsP7mzg==
X-Google-Smtp-Source: AGHT+IGgruZuQVFa5oEJQDX8aqb5/Ot/vkkklZXcQPqwbozIu7QKs3JXX4OMcsRDkgheysPCEwBdhA==
X-Received: by 2002:a05:6512:15a3:b0:507:b0a1:6088 with SMTP id bp35-20020a05651215a300b00507b0a16088mr5413280lfb.46.1700756264200;
        Thu, 23 Nov 2023 08:17:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y3-20020adfee03000000b0032f7e832cabsm2052748wrn.90.2023.11.23.08.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:17:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] pmdomain: amlogic: meson-ee-pwrc: add ISP power
 domain
Date: Thu, 23 Nov 2023 17:17:40 +0100
Message-Id: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-0-61f2fcf709e5@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACR7X2UC/5WNTQ6CMBBGr0Jm7ZhOFYiuvIdhMYEWJqE/aZFoC
 He3cgNXX963eG+DbJKYDPdqg2RWyRJ8AX2qoJ/YjwZlKAxa6QsRXXEJUXpkN4ex7CvmJRl2KDl
 idENwLB5tWytdN2RvRFBMMRkr76Py7ApPkpeQPkd0pd/7n38lVGgVmcb23LSsHrN4TuEc0gjdv
 u9fF1HfkNcAAAA=
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9FcVA9H1qv0poQwZkxkRJQ5+OyLnOc8rdQ539wz0wiQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlX3sl/oeVw69IbWwEg0CwIM/8QW1I7Km1XZjYjaJs
 bkGoziKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZV97JQAKCRB33NvayMhJ0Y8cD/
 4lM8bue7qAIylsKEW9oZVV638spFcUpbyNzb1mU3hwuhKS9H2tJVvNeqbWSK3gXoR14OIMAxjRL5ro
 3aDOtyBlDlfkspncumv3v460IQSN8/Ca+KWTfmGF7HdkPrnI9YTk5jdOShA3wttqCMQC8vDRpmMq7A
 BQT1iBkgocNOI/dQ8jPvM1M4Na8iBagMStLM/Hnqjc6Z69if+XeSfK1JkVerOXpktYcsQxGaf188YH
 0MCV5LB7Wf+0xBcIjD6pJyIUF5SQqiK2votYzKla8leOogRV5+HdypCumad35KB+swbARwQvaPg10J
 GasOhGWPphHFACyKC/742I2VDmG8r3A2WR3H7LkghU5IBL7G80qec3xPvF+n7WgktqGLg4iJVa4gF0
 zFKxRmz+l6oyL+2tPHLwHYBS717ZKB+I/GG98L2Eq3zWoP7skXpp3NcZ0RnTeiTmwBs21F2ARKsXzV
 4TJ2LNjG29zao96AcwlpqavGjdGx+McxTOMRgb5XvQWEvr+JW5IPe1+Jyfj7nY6xBrAtCwRFjID6Dr
 U/M63T6Zcn+CD+BIVZ6h3HizfnRFFUgrE1aP3HmPalq/MmJ7Ms+xYTttPPuowFyr3tf4T4cxth93VA
 ahFw30yjwMrXgh4XcmrQjx41X5c9H8srGZ8F6AFAJFgK6d1+RWdCOAdMEsig==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_081747_153639_FF7A8171 
X-CRM114-Status: UNSURE (   7.15  )
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

Add MIPI ISP power domain bindings and entries for the ISP power domain
found in the Amlogic G12B SoC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Correctly use REG1 for second g12a_pwrc_mem_isp cell
- Link to v1: https://lore.kernel.org/r/20231114-topic-amlogic-upstream-isp-pmdomain-v1-0-f01e6fca67a0@linaro.org

---
Neil Armstrong (2):
      dt-bindings: power: meson-g12a-power: document ISP power domain
      pmdomain: amlogic: meson-ee-pwrc: add support for G12A ISP power domain

 drivers/pmdomain/amlogic/meson-ee-pwrc.c     | 16 ++++++++++++++++
 include/dt-bindings/power/meson-g12a-power.h |  1 +
 2 files changed, 17 insertions(+)
---
base-commit: 5cd631a52568a18b12fd2563418985c8cb63e4b0
change-id: 20231114-topic-amlogic-upstream-isp-pmdomain-f7502561f911

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
